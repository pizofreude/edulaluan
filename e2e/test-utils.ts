import { test as base, expect, type Page } from '@playwright/test';

/**
 * Test Utilities for EduLaluan E2E Tests
 */

// Test user data
export interface TestUser {
  email: string;
  password: string;
  fullName?: string;
  role?: 'user' | 'moderator' | 'admin';
}

// Test contribution data
export interface TestContribution {
  type: string;
  title: string;
  description: string;
  url?: string;
  categoryId?: string;
}

// Test circumcision submission data
export interface TestCircumcisionSubmission {
  displayName: string;
  isAnonymous: boolean;
  gender: 'male' | 'female';
  method: string;
  clinicName: string;
  location: string;
  practitionerName?: string;
  clinicContact?: string;
  experience: string;
}

// Generate unique email for tests
export function generateTestEmail(prefix: string = 'test'): string {
  const timestamp = Date.now();
  const random = Math.random().toString(36).substring(2, 7);
  return `${prefix}_${timestamp}_${random}@test.edulaluan.my`;
}

// Generate test password
export function generateTestPassword(): string {
  return `TestPass${Math.random().toString(36).substring(2, 8)}!`;
}

// Default test users
export const testUsers = {
  regular: {
    email: generateTestEmail('user'),
    password: generateTestPassword(),
    fullName: 'Test User',
    role: 'user' as const,
  },
  moderator: {
    email: generateTestEmail('mod'),
    password: generateTestPassword(),
    fullName: 'Test Moderator',
    role: 'moderator' as const,
  },
  admin: {
    email: generateTestEmail('admin'),
    password: generateTestPassword(),
    fullName: 'Test Admin',
    role: 'admin' as const,
  },
};

// Default test circumcision submission
export const defaultCircumcisionSubmission: TestCircumcisionSubmission = {
  displayName: 'Test Contributor',
  isAnonymous: false,
  gender: 'male',
  method: 'Conventional sleeve',
  clinicName: 'Klinik Kesihatan Test',
  location: 'Test City, Test State',
  practitionerName: 'Dr. Test',
  clinicContact: '03-1234 5678',
  experience: 'This is a test circumcision experience submission. The process was smooth and the staff were very professional. Recovery took about one week and the cost was affordable. Would recommend this clinic to other reverts looking for circumcision services. The doctor explained everything clearly and made me feel comfortable throughout the procedure.',
};

// Default female circumcision submission
export const defaultFemaleCircumcisionSubmission: TestCircumcisionSubmission = {
  displayName: 'Sarah Test',
  isAnonymous: false,
  gender: 'female',
  method: 'Needle prick only',
  clinicName: 'KPJ Test Hospital',
  location: 'Test City, Test State',
  practitionerName: 'Dr. Test Female',
  clinicContact: '03-8765 4321',
  experience: 'This is a test female circumcision experience. The procedure was just a gentle needle prick as explained. No cutting, no tissue removal. The doctor was very professional and explained the difference between sunat perempuan and FGM clearly. Recovery was immediate and there was minimal discomfort. Would recommend for other revert sisters.',
};

/**
 * Custom test fixture with authentication helpers
 */
export const test = base.extend<{
  page: Page;
  signIn: (user: TestUser) => Promise<void>;
  signOut: () => Promise<void>;
  createTestUser: () => Promise<TestUser>;
  submitCircumcision: (data: TestCircumcisionSubmission) => Promise<void>;
  approveContribution: (contributionId: string) => Promise<void>;
}>({
  page: async ({ page }, use) => {
    // Set viewport for desktop
    await page.setViewportSize({ width: 1920, height: 1080 });
    await use(page);
  },

  signIn: async ({ page }, use) => {
    const signInFn = async (user: TestUser) => {
      await page.goto('/auth/login');
      await page.fill('input[type="email"]', user.email);
      await page.fill('input[type="password"]', user.password);
      await page.click('button[type="submit"]');
      await page.waitForURL(/\/user\/dashboard|^\//);
    };
    await use(signInFn);
  },

  signOut: async ({ page }, use) => {
    const signOutFn = async () => {
      await page.click('[data-testid="user-menu"]');
      await page.click('[data-testid="logout"]');
      await page.waitForURL('/');
    };
    await use(signOutFn);
  },

  createTestUser: async ({ page }, use) => {
    const createTestUserFn = async (): Promise<TestUser> => {
      const user = {
        email: generateTestEmail(),
        password: generateTestPassword(),
        fullName: 'Test User',
        role: 'user' as const,
      };

      // Sign up
      await page.goto('/auth/signup');
      await page.fill('input[type="email"]', user.email);
      await page.fill('input[type="password"]', user.password);
      await page.fill('input[name="fullName"]', user.fullName!);
      await page.click('button[type="submit"]');
      await page.waitForURL(/\/user\/dashboard|^\//);

      return user;
    };
    await use(createTestUserFn);
  },

  submitCircumcision: async ({ page }, use) => {
    const submitFn = async (data: TestCircumcisionSubmission) => {
      await page.goto('/panduan-rakyat/section-04/4.7-circumcision-resources');
      
      // Click "Share Your Experience" button
      await page.click('button:has-text("Share Your Experience")');
      
      // Fill display name
      if (!data.isAnonymous) {
        await page.fill('input[placeholder*="display name"]', data.displayName);
      } else {
        await page.check('input[type="checkbox"]');
      }
      
      // Select gender
      await page.selectOption('select', data.gender);
      
      // Select method
      await page.selectOption('select[name="method"]', data.method);
      
      // Fill clinic details
      await page.fill('input[placeholder*="clinic"]', data.clinicName);
      await page.fill('input[placeholder*="location"]', data.location);
      
      if (data.practitionerName) {
        await page.fill('input[placeholder*="practitioner"]', data.practitionerName);
      }
      
      if (data.clinicContact) {
        await page.fill('input[placeholder*="contact"]', data.clinicContact);
      }
      
      // Fill experience
      await page.fill('textarea', data.experience);
      
      // Submit
      await page.click('button:has-text("Submit for Review")');
      
      // Wait for success message
      await page.waitForSelector('text="Submission Received!"', { timeout: 5000 });
    };
    await use(submitFn);
  },

  approveContribution: async ({ page }, use) => {
    const approveFn = async (contributionId: string) => {
      await page.goto('/admin/moderation');
      
      // Find the contribution and approve
      const contributionRow = page.locator(`[data-contribution-id="${contributionId}"]`);
      await contributionRow.waitFor();
      await contributionRow.click();
      
      // Click approve button
      await page.click('button:has-text("Approve")');
      
      // Confirm approval
      await page.click('button:has-text("Confirm")');
      
      // Wait for success message
      await page.waitForSelector('text="Contribution approved!"', { timeout: 5000 });
    };
    await use(approveFn);
  },
});

// Re-export expect
export { expect };

/**
 * Common assertions
 */
export const expectToBeOnPage = async (page: Page, urlPattern: RegExp) => {
  await expect(page).toHaveURL(urlPattern);
};

export const expectToSeeError = async (page: Page, message: string) => {
  await expect(page.locator(`text="${message}"`)).toBeVisible();
};

export const expectToSeeSuccess = async (page: Page, message: string) => {
  await expect(page.locator(`text="${message}"`)).toBeVisible();
};

/**
 * Wait helpers
 */
export const waitForLoading = async (page: Page) => {
  await page.waitForSelector('[data-testid="loading"]', { state: 'visible' });
  await page.waitForSelector('[data-testid="loading"]', { state: 'hidden' });
};

export const waitForToast = async (page: Page, type: 'success' | 'error' = 'success') => {
  await page.waitForSelector(`[data-testid="toast-${type}"]`, { timeout: 5000 });
};
