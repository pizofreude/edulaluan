import { test, expect } from './test-utils';

/**
 * Authentication Flow Tests
 * Tests for signup, login, logout, and password reset flows
 */

test.describe('Authentication Flow', () => {
  test.describe('Signup', () => {
    test('should create a new user account successfully', async ({ page }) => {
      const email = `test_signup_${Date.now()}@test.edulaluan.my`;
      const password = 'TestPass123!';
      const fullName = 'Test Signup User';

      // Go to signup page
      await page.goto('/auth/signup');

      // Fill signup form
      await page.fill('input[type="email"]', email);
      await page.fill('input[type="password"]', password);
      await page.fill('input[name="fullName"]', fullName);

      // Submit form
      await page.click('button[type="submit"]');

      // Wait for redirect to dashboard or home
      await page.waitForURL(/\/user\/dashboard|^\//);

      // Verify user is logged in (check for user menu or dashboard content)
      await expect(page.locator('[data-testid="user-menu"], text="Dashboard"')).toBeVisible();
    });

    test('should show error for existing email', async ({ page }) => {
      // Use a known test email
      const email = 'existing@test.edulaluan.my';
      const password = 'TestPass123!';

      await page.goto('/auth/signup');

      await page.fill('input[type="email"]', email);
      await page.fill('input[type="password"]', password);
      await page.click('button[type="submit"]');

      // Should show error message
      await expect(page.locator('text=/already exists|email.*taken/i')).toBeVisible();
    });

    test('should validate password strength', async ({ page }) => {
      const email = `test_weak_${Date.now()}@test.edulaluan.my`;
      const weakPassword = '123';

      await page.goto('/auth/signup');

      await page.fill('input[type="email"]', email);
      await page.fill('input[type="password"]', weakPassword);
      await page.click('button[type="submit"]');

      // Should show password validation error
      await expect(page.locator('text=/password.*weak|minimum.*6/i')).toBeVisible();
    });

    test('should validate email format', async ({ page }) => {
      const invalidEmail = 'not-an-email';
      const password = 'TestPass123!';

      await page.goto('/auth/signup');

      await page.fill('input[type="email"]', invalidEmail);
      await page.fill('input[type="password"]', password);
      await page.click('button[type="submit"]');

      // Should show email validation error
      await expect(page.locator('text=/invalid.*email|email.*format/i')).toBeVisible();
    });
  });

  test.describe('Login', () => {
    test('should login with valid credentials', async ({ page, createTestUser }) => {
      // Create a test user first
      const user = await createTestUser();

      // Logout
      await page.click('[data-testid="user-menu"]');
      await page.click('[data-testid="logout"]');
      await page.waitForURL('/');

      // Login with the created user
      await page.goto('/auth/login');
      await page.fill('input[type="email"]', user.email);
      await page.fill('input[type="password"]', user.password);
      await page.click('button[type="submit"]');

      // Wait for redirect
      await page.waitForURL(/\/user\/dashboard|^\//);

      // Verify user is logged in
      await expect(page.locator('[data-testid="user-menu"]')).toBeVisible();
    });

    test('should show error for invalid credentials', async ({ page }) => {
      const email = 'nonexistent@test.edulaluan.my';
      const password = 'WrongPassword123!';

      await page.goto('/auth/login');

      await page.fill('input[type="email"]', email);
      await page.fill('input[type="password"]', password);
      await page.click('button[type="submit"]');

      // Should show error message
      await expect(page.locator('text=/invalid.*credentials|email.*not.*found/i')).toBeVisible();
    });

    test('should show error for wrong password', async ({ page, createTestUser }) => {
      const user = await createTestUser();
      const wrongPassword = 'WrongPassword123!';

      // Logout first
      await page.click('[data-testid="user-menu"]');
      await page.click('[data-testid="logout"]');
      await page.waitForURL('/');

      await page.goto('/auth/login');

      await page.fill('input[type="email"]', user.email);
      await page.fill('input[type="password"]', wrongPassword);
      await page.click('button[type="submit"]');

      // Should show error message
      await expect(page.locator('text=/invalid.*credentials|wrong.*password/i')).toBeVisible();
    });
  });

  test.describe('Logout', () => {
    test('should logout successfully', async ({ page, createTestUser }) => {
      // Create and login a test user
      await createTestUser();

      // Verify logged in state
      await expect(page.locator('[data-testid="user-menu"]')).toBeVisible();

      // Logout
      await page.click('[data-testid="user-menu"]');
      await page.click('[data-testid="logout"]');

      // Wait for redirect to home
      await page.waitForURL('/');

      // Verify logged out state
      await expect(page.locator('[data-testid="user-menu"]')).not.toBeVisible();
      await expect(page.locator('text=/login|sign.*in/i')).toBeVisible();
    });
  });

  test.describe('Navigation', () => {
    test('should redirect to login when accessing protected routes', async ({ page }) => {
      // Try to access user dashboard without authentication
      await page.goto('/user/dashboard');

      // Should redirect to login or show login prompt
      await page.waitForURL(/\/auth\/login|^\//);
    });

    test('should redirect to dashboard when accessing auth pages while logged in', async ({ page, createTestUser }) => {
      // Create and login a test user
      await createTestUser();

      // Try to access login page
      await page.goto('/auth/login');

      // Should redirect to dashboard
      await page.waitForURL(/\/user\/dashboard|^\//);
    });

    test('should show login button in header when not authenticated', async ({ page }) => {
      await page.goto('/');

      // Should show login/signup buttons
      await expect(page.locator('text=/login|sign.*in/i')).toBeVisible();
      await expect(page.locator('text=/signup|sign.*up/i')).toBeVisible();
    });

    test('should show user menu in header when authenticated', async ({ page, createTestUser }) => {
      // Create and login a test user
      await createTestUser();

      await page.goto('/');

      // Should show user menu
      await expect(page.locator('[data-testid="user-menu"]')).toBeVisible();
    });
  });

  test.describe('2FA Flow', () => {
    test.skip('should prompt for 2FA code when enabled', async ({ page }) => {
      // TODO: Implement when 2FA is implemented
      test.skip(true, '2FA not yet implemented');
    });

    test.skip('should login with valid 2FA code', async ({ page }) => {
      // TODO: Implement when 2FA is implemented
      test.skip(true, '2FA not yet implemented');
    });
  });
});
