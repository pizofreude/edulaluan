import { test, expect, defaultCircumcisionSubmission, defaultFemaleCircumcisionSubmission } from './test-utils';

/**
 * Circumcision Submission Flow Tests
 * Tests for the community circumcision resource submission feature
 */

test.describe('Circumcision Submission Flow', () => {
  test.describe('Page Access', () => {
    test('should load circumcision resources page', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Verify page title
      await expect(page).toHaveTitle(/Circumcision Resources/);

      // Verify editorial notice is visible
      await expect(page.locator('text=/Female Sunat|Female Circumcision/i')).toBeVisible();

      // Verify filter bar is visible
      await expect(page.locator('button:has-text("All")')).toBeVisible();
      await expect(page.locator('button:has-text("Male")')).toBeVisible();
      await expect(page.locator('button:has-text("Female")')).toBeVisible();
    });

    test('should display editorial notice about female sunat', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Verify FGM distinction is clear
      await expect(page.locator('text=/NO cutting/i')).toBeVisible();
      await expect(page.locator('text=/NO tissue removal/i')).toBeVisible();
      await expect(page.locator('text=/NO lasting anatomical alteration/i')).toBeVisible();
      await expect(page.locator('text=/FGM|Female Genital Mutilation/i')).toBeVisible();
    });

    test('should display sample submissions', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Verify submission count pill shows at least 4 submissions
      await expect(page.locator('text=/\\d+ submissions?/i')).toBeVisible();

      // Verify at least one submission is visible
      await expect(page.locator('text=/Klinik|Hospital|Clinic/i')).toBeVisible();
    });
  });

  test.describe('Filter Functionality', () => {
    test('should filter submissions by gender - All', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Click "All" filter
      await page.click('button:has-text("All")');

      // Should show all submissions (male and female)
      const submissionCount = await page.locator('[data-testid="submission-item"]').count();
      expect(submissionCount).toBeGreaterThan(0);
    });

    test('should filter submissions by gender - Male only', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Click "Male" filter
      await page.click('button:has-text("Male")');

      // Should only show male submissions
      const maleBadge = page.locator('text=/Male/i').first();
      await expect(maleBadge).toBeVisible();
    });

    test('should filter submissions by gender - Female only', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Click "Female" filter
      await page.click('button:has-text("Female")');

      // Should only show female submissions
      const femaleBadge = page.locator('text=/Female/i').first();
      await expect(femaleBadge).toBeVisible();
    });

    test('should update submission count when filtering', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Get initial count (All)
      await page.click('button:has-text("All")');
      const allCountText = await page.locator('text=/\\d+ submissions?/i').first().textContent();
      const allCount = parseInt(allCountText?.match(/\d+/)?.[0] || '0');

      // Filter by male
      await page.click('button:has-text("Male")');
      const maleCountText = await page.locator('text=/\\d+ submissions?/i').first().textContent();
      const maleCount = parseInt(maleCountText?.match(/\d+/)?.[0] || '0');

      // Male count should be less than or equal to all count
      expect(maleCount).toBeLessThanOrEqual(allCount);
    });
  });

  test.describe('Submission Expansion', () => {
    test('should expand submission details on click', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Click first submission
      const firstSubmission = page.locator('[data-testid="submission-item"]').first();
      await firstSubmission.click();

      // Should show expanded details
      await expect(page.locator('text=/Clinic.*:|Location.*:/i')).toBeVisible();
      await expect(page.locator('text=/Method.*:/i')).toBeVisible();
      await expect(page.locator('text=/Experience:/i')).toBeVisible();
    });

    test('should collapse submission on second click', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Click first submission to expand
      const firstSubmission = page.locator('[data-testid="submission-item"]').first();
      await firstSubmission.click();

      // Verify expanded
      await expect(page.locator('text=/Experience:/i')).toBeVisible();

      // Click again to collapse
      await firstSubmission.click();

      // Should be collapsed (experience not visible)
      await expect(page.locator('text=/Experience:/i')).not.toBeVisible();
    });

    test('should show practitioner name when available', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Expand a submission with practitioner
      const firstSubmission = page.locator('[data-testid="submission-item"]').first();
      await firstSubmission.click();

      // Check if practitioner is shown (if available)
      const hasPractitioner = await page.locator('text=/Practitioner.*:/i').isVisible();
      if (hasPractitioner) {
        await expect(page.locator('text=/Dr\\./i')).toBeVisible();
      }
    });
  });

  test.describe('Contribution Form - Authentication', () => {
    test('should prompt login when not authenticated', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Scroll to contribution section
      await page.click('button:has-text("Share Your Experience")');

      // Should show login prompt
      await expect(page.locator('text=/login|sign.*in/i')).toBeVisible();
      await expect(page.locator('text=/You need to be logged in/i')).toBeVisible();
    });

    test('should redirect to login on clicking login button', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Click login button in contribution section
      await page.click('button:has-text("Login to Share")');

      // Should redirect to login page
      await page.waitForURL(/\/auth\/login/);
    });

    test('should show contribution form when authenticated', async ({ page, createTestUser }) => {
      // Create and login a test user
      await createTestUser();

      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Should show "Share Your Experience" button
      await expect(page.locator('button:has-text("Share Your Experience")')).toBeVisible();

      // Click to show form
      await page.click('button:has-text("Share Your Experience")');

      // Form should be visible
      await expect(page.locator('text=/Display Name/i')).toBeVisible();
      await expect(page.locator('text=/Gender/i')).toBeVisible();
      await expect(page.locator('text=/Method/i')).toBeVisible();
    });
  });

  test.describe('Contribution Form - Validation', () => {
    test.beforeEach(async ({ page, createTestUser }) => {
      // Create and login a test user before each test
      await createTestUser();
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');
      await page.click('button:has-text("Share Your Experience")');
    });

    test('should require display name or anonymous toggle', async ({ page }) => {
      // Fill form without display name and without anonymous
      await page.selectOption('select', 'male');
      await page.selectOption('select[name="method"]', 'Conventional sleeve');
      await page.fill('input[placeholder*="clinic"]', 'Test Clinic');
      await page.fill('input[placeholder*="location"]', 'Test Location');
      await page.fill('textarea', defaultCircumcisionSubmission.experience);

      // Submit
      await page.click('button:has-text("Submit for Review")');

      // Should show validation error
      await expect(page.locator('text=/display name|anonymous/i')).toBeVisible();
    });

    test('should disable display name when anonymous is checked', async ({ page }) => {
      // Check anonymous
      await page.check('input[type="checkbox"]');

      // Display name should be disabled
      const displayNameInput = page.locator('input[placeholder*="display name"]');
      await expect(displayNameInput).toBeDisabled();
    });

    test('should require gender selection', async ({ page }) => {
      // Check anonymous to skip name validation
      await page.check('input[type="checkbox"]');

      // Try to submit without gender
      await page.click('button:has-text("Submit for Review")');

      // Should show validation error
      await expect(page.locator('text=/gender/i')).toBeVisible();
    });

    test('should require method selection', async ({ page }) => {
      // Check anonymous and select gender
      await page.check('input[type="checkbox"]');
      await page.selectOption('select', 'male');

      // Try to submit without method
      await page.click('button:has-text("Submit for Review")');

      // Should show validation error
      await expect(page.locator('text=/method/i')).toBeVisible();
    });

    test('should require clinic name', async ({ page }) => {
      // Check anonymous and select gender and method
      await page.check('input[type="checkbox"]');
      await page.selectOption('select', 'male');
      await page.selectOption('select[name="method"]', 'Conventional sleeve');

      // Try to submit without clinic name
      await page.click('button:has-text("Submit for Review")');

      // Should show validation error
      await expect(page.locator('text=/clinic|hospital/i')).toBeVisible();
    });

    test('should require location', async ({ page }) => {
      // Check anonymous and select gender and method, fill clinic
      await page.check('input[type="checkbox"]');
      await page.selectOption('select', 'male');
      await page.selectOption('select[name="method"]', 'Conventional sleeve');
      await page.fill('input[placeholder*="clinic"]', 'Test Clinic');

      // Try to submit without location
      await page.click('button:has-text("Submit for Review")');

      // Should show validation error
      await expect(page.locator('text=/location/i')).toBeVisible();
    });

    test('should require minimum 30 characters for experience', async ({ page }) => {
      // Check anonymous and select gender and method, fill required fields
      await page.check('input[type="checkbox"]');
      await page.selectOption('select', 'male');
      await page.selectOption('select[name="method"]', 'Conventional sleeve');
      await page.fill('input[placeholder*="clinic"]', 'Test Clinic');
      await page.fill('input[placeholder*="location"]', 'Test Location');

      // Fill short experience (less than 30 chars)
      await page.fill('textarea', 'Too short experience');

      // Submit
      await page.click('button:has-text("Submit for Review")');

      // Should show validation error about minimum characters
      await expect(page.locator('text=/30.*character|minimum/i')).toBeVisible();
    });
  });

  test.describe('Female Submission Specific', () => {
    test.beforeEach(async ({ page, createTestUser }) => {
      await createTestUser();
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');
      await page.click('button:has-text("Share Your Experience")');
    });

    test('should show female sunat notice when female gender selected', async ({ page }) => {
      // Select female gender
      await page.selectOption('select', 'female');

      // Should show teal notice box about female sunat
      await expect(page.locator('text=/needle prick|clitoral hood/i')).toBeVisible();
      await expect(page.locator('text=/NO cutting|NO tissue/i')).toBeVisible();
    });

    test('should lock method to "Needle prick only" for female', async ({ page }) => {
      // Select female gender
      await page.selectOption('select', 'female');

      // Method dropdown should be disabled or only show "Needle prick only"
      const methodSelect = page.locator('select[name="method"]');
      const selectedValue = await methodSelect.inputValue();
      expect(selectedValue).toBe('Needle prick only');

      // Verify dropdown is disabled
      await expect(methodSelect).toBeDisabled();
    });

    test('should show inline clarification for female method', async ({ page }) => {
      // Select female gender
      await page.selectOption('select', 'female');

      // Should show inline text about needle prick only
      await expect(page.locator('text=/symbolic|needle prick.*only/i')).toBeVisible();
    });

    test('should submit female circumcision experience successfully', async ({ page }) => {
      // Fill female submission form
      await page.fill('input[placeholder*="display name"]', defaultFemaleCircumcisionSubmission.displayName);
      await page.selectOption('select', 'female');
      // Method is auto-selected for female
      await page.fill('input[placeholder*="clinic"]', defaultFemaleCircumcisionSubmission.clinicName);
      await page.fill('input[placeholder*="location"]', defaultFemaleCircumcisionSubmission.location);
      await page.fill('input[placeholder*="practitioner"]', defaultFemaleCircumcisionSubmission.practitionerName!);
      await page.fill('input[placeholder*="contact"]', defaultFemaleCircumcisionSubmission.clinicContact!);
      await page.fill('textarea', defaultFemaleCircumcisionSubmission.experience);

      // Submit
      await page.click('button:has-text("Submit for Review")');

      // Wait for success message
      await expect(page.locator('text=/Submission Received|Thank you.*sharing/i')).toBeVisible({ timeout: 5000 });
    });
  });

  test.describe('Full Submission Flow', () => {
    test('should submit male circumcision experience successfully', async ({ page, createTestUser }) => {
      // Create and login
      await createTestUser();

      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');
      await page.click('button:has-text("Share Your Experience")');

      // Fill form
      await page.fill('input[placeholder*="display name"]', defaultCircumcisionSubmission.displayName);
      await page.selectOption('select', 'male');
      await page.selectOption('select[name="method"]', defaultCircumcisionSubmission.method);
      await page.fill('input[placeholder*="clinic"]', defaultCircumcisionSubmission.clinicName);
      await page.fill('input[placeholder*="location"]', defaultCircumcisionSubmission.location);
      await page.fill('input[placeholder*="practitioner"]', defaultCircumcisionSubmission.practitionerName!);
      await page.fill('input[placeholder*="contact"]', defaultCircumcisionSubmission.clinicContact!);
      await page.fill('textarea', defaultCircumcisionSubmission.experience);

      // Submit
      await page.click('button:has-text("Submit for Review")');

      // Wait for success message
      await expect(page.locator('text=/Submission Received|Thank you.*sharing/i')).toBeVisible({ timeout: 5000 });

      // Verify form is hidden after submission
      await expect(page.locator('textarea')).not.toBeVisible();
    });

    test('should show moderation notice after submission', async ({ page, createTestUser }) => {
      await createTestUser();

      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');
      await page.click('button:has-text("Share Your Experience")');

      // Fill minimal valid form
      await page.check('input[type="checkbox"]'); // Anonymous
      await page.selectOption('select', 'male');
      await page.selectOption('select[name="method"]', 'Conventional sleeve');
      await page.fill('input[placeholder*="clinic"]', 'Test Clinic');
      await page.fill('input[placeholder*="location"]', 'Test Location');
      await page.fill('textarea', defaultCircumcisionSubmission.experience);

      // Submit
      await page.click('button:has-text("Submit for Review")');

      // Should show moderation notice
      await expect(page.locator('text=/review|moderat|2-3 business/i')).toBeVisible();
    });
  });

  test.describe('Related Resources', () => {
    test('should display related resource links', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Scroll to related resources section
      await page.locator('text=/Related Resources/i').scrollIntoViewIfNeeded();

      // Verify related links are visible
      await expect(page.locator('text=/4.1.*Ministry.*Health|4.2.*Public.*Private/i')).toBeVisible();
      await expect(page.locator('text=/4.3.*Government.*Hospital/i')).toBeVisible();
    });

    test('should navigate to related resource on click', async ({ page }) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');

      // Click on a related resource link
      await page.click('a:has-text("4.2")');

      // Should navigate to the related page
      await page.waitForURL(/\/panduan-rakyat\/section-04\/4.2/);
    });
  });
});
