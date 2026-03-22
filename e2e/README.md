# EduLaluan E2E Tests

End-to-end tests for EduLaluan using Playwright.

## 📋 Test Suites

| Suite | File | Description |
|-------|------|-------------|
| **Authentication** | `01-auth.spec.ts` | Signup, login, logout, 2FA flows |
| **Circumcision Submission** | `02-circumcision-submission.spec.ts` | Community submission widget, form validation, FGM prevention |
| **Admin Moderation** | `03-admin-moderation.spec.ts` | Moderation queue, approval/rejection flows, FGM detection |
| **Gamification** | `04-gamification.spec.ts` | Points, badges, leaderboards, tier system |

## 🚀 Quick Start

### 1. Install Playwright Browsers

```bash
npx playwright install
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Start Development Server

```bash
# Terminal 1: Start Supabase local
npm run supabase:start

# Terminal 2: Start Astro dev server
npm run dev
```

### 4. Run Tests

```bash
# Run all tests
npx playwright test

# Run specific test suite
npx playwright test e2e/01-auth.spec.ts
npx playwright test e2e/02-circumcision-submission.spec.ts

# Run in headed mode (see browser)
npx playwright test --headed

# Run specific browser
npx playwright test --project=chromium
npx playwright test --project=firefox

# Run with UI mode (interactive)
npx playwright test --ui

# Run with debug mode
npx playwright test --debug
```

## 📊 Test Reports

After running tests, generate HTML report:

```bash
npx playwright show-report
```

Reports are saved to `playwright-report/`.

## 🧪 Test Structure

### Test Utilities (`e2e/test-utils.ts`)

Common fixtures and helpers:

```typescript
import { test, expect, generateTestEmail } from './test-utils';

test('should do something', async ({ page, signIn, createTestUser }) => {
  const user = await createTestUser();
  await signIn(user);
  // ... test logic
});
```

### Available Fixtures

| Fixture | Description |
|---------|-------------|
| `page` | Playwright page with 1920x1080 viewport |
| `signIn(user)` | Sign in with provided user |
| `signOut()` | Sign out current user |
| `createTestUser()` | Create and return new test user |
| `submitCircumcision(data)` | Submit circumcision experience |
| `approveContribution(id)` | Approve contribution as admin |

### Helper Functions

```typescript
// Generate unique test email
generateTestEmail('prefix') // → 'prefix_1234567890_abcde@test.edulaluan.my'

// Generate secure test password
generateTestPassword() // → 'TestPassAbc123!'

// Common assertions
expectToBeOnPage(page, /\/user\/dashboard/)
expectToSeeError(page, 'Invalid credentials')
expectToSeeSuccess(page, 'Submission received!')
```

## 📝 Writing Tests

### Example Test

```typescript
import { test, expect } from './test-utils';

test.describe('My Feature', () => {
  test('should work correctly', async ({ page }) => {
    // Navigate to page
    await page.goto('/my-page');

    // Interact with elements
    await page.fill('input[name="email"]', 'test@example.com');
    await page.click('button[type="submit"]');

    // Assert results
    await expect(page.locator('text="Success!"')).toBeVisible();
    await expect(page).toHaveURL(/\/success/);
  });
});
```

### Test Naming Convention

- Use descriptive names: `should [action] when [condition]`
- Group related tests with `test.describe`
- Use `test.skip` for tests requiring unimplemented features
- Use `test.only` for debugging single tests

## 🔧 Configuration

### Environment Variables

Create `.env.local` in project root:

```bash
# Test configuration
TEST_BASE_URL=http://127.0.0.1:4321

# Supabase local
SUPABASE_URL=http://127.0.0.1:54321
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### Playwright Config (`playwright.config.ts`)

Key settings:
- **Timeout**: 60s per test, 15s per action
- **Retries**: 0 (local), 2 (CI)
- **Screenshots**: On failure only
- **Video**: On failure only
- **Trace**: On first retry

## 🎯 Test Coverage Goals

| Feature | Target | Status |
|---------|--------|--------|
| Authentication | 100% | ✅ Complete |
| Circumcision Submission | 100% | ✅ Complete |
| Admin Moderation | 80% | ⏳ Skipped (needs admin auth) |
| Gamification | 60% | ⏳ Skipped (needs seeded data) |

## 🐛 Debugging Tests

### Run in Debug Mode

```bash
npx playwright test --debug
```

### Run Specific Test

```bash
npx playwright test -g "should submit male circumcision experience"
```

### Use Playwright Inspector

```bash
PWDEBUG=1 npx playwright test
```

### Generate Test Code

```bash
npx playwright codegen http://127.0.0.1:4321
```

## 📋 CI/CD Integration

### GitHub Actions Example

```yaml
name: E2E Tests
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npm run supabase:start &
      - run: npm run dev &
      - run: npx playwright test
      - uses: actions/upload-artifact@v4
        if: failure()
        with:
          name: playwright-report
          path: playwright-report/
```

## 🚨 Common Issues

### Tests Timeout

- Increase timeout in `playwright.config.ts`
- Check if dev server is running
- Verify Supabase local is started

### Element Not Found

- Wait for element: `await page.waitForSelector('selector')`
- Check for loading states
- Verify test data is seeded

### Authentication Issues

- Ensure `createTestUser()` completes before use
- Check for redirect timing
- Verify session cookies are set

## 📚 Resources

- [Playwright Docs](https://playwright.dev)
- [Playwright Test Assertions](https://playwright.dev/docs/test-assertions)
- [Playwright Fixtures](https://playwright.dev/docs/test-fixtures)

---

💚 **EduLaluan** — Smart Education Resource Navigator for Malaysia
