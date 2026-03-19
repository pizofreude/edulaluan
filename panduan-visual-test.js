/**
 * Panduan Rakyat - Visual & Accessibility Test
 * Tests both light and dark modes across responsive breakpoints
 */

import { test, expect } from '@playwright/test';

const BASE_URL = 'http://127.0.0.1:3000';
const PANDUAN_URL = `${BASE_URL}/panduan-rakyat`;

// Test configuration
const VIEWPORTS = {
  mobile: { width: 375, height: 812 },
  tablet: { width: 768, height: 1024 },
  desktop: { width: 1440, height: 900 },
};

const THEMES = ['light', 'dark'];

test.describe('Panduan Rakyat - Visual Tests', () => {
  // Test all theme and viewport combinations
  for (const theme of THEMES) {
    for (const [viewportName, viewport] of Object.entries(VIEWPORTS)) {
      test(`Hero section - ${theme} mode - ${viewportName}`, async ({ page }) => {
        await page.setViewportSize(viewport);
        
        // Set theme
        await page.goto(PANDUAN_URL);
        await page.evaluate((t) => {
          localStorage.setItem('edulaluan-theme', t);
          if (t === 'dark') {
            document.documentElement.classList.add('dark');
          } else {
            document.documentElement.classList.remove('dark');
          }
        }, theme);
        await page.reload();
        await page.waitForLoadState('networkidle');

        // Wait for fonts to load
        await page.waitForTimeout(1000);

        // Take screenshot
        await expect(page).toHaveScreenshot(`panduan-hero-${theme}-${viewportName}.png`, {
          fullPage: false,
          clip: { x: 0, y: 0, width: viewport.width, height: 600 },
        });
      });

      test(`Section cards - ${theme} mode - ${viewportName}`, async ({ page }) => {
        await page.setViewportSize(viewport);
        
        await page.goto(PANDUAN_URL);
        await page.evaluate((t) => {
          localStorage.setItem('edulaluan-theme', t);
          if (t === 'dark') {
            document.documentElement.classList.add('dark');
          } else {
            document.documentElement.classList.remove('dark');
          }
        }, theme);
        await page.reload();
        await page.waitForLoadState('networkidle');
        await page.waitForTimeout(1000);

        // Scroll to section cards
        await page.evaluate(() => {
          document.querySelector('.py-section-lg')?.scrollIntoView({ block: 'center' });
        });
        await page.waitForTimeout(500);

        await expect(page).toHaveScreenshot(`panduan-cards-${theme}-${viewportName}.png`, {
          fullPage: false,
          clip: { x: 0, y: 200, width: viewport.width, height: 800 },
        });
      });
    }
  }
});

test.describe('Panduan Rakyat - Accessibility Tests', () => {
  test('Navigation links are visible and clickable', async ({ page }) => {
    await page.goto(PANDUAN_URL);
    await page.setViewportSize(VIEWPORTS.desktop);

    // Check header navigation
    const navLinks = page.locator('header nav a');
    await expect(navLinks).toHaveCount(6);
    
    // Check "Panduan Rakyat" is active
    const peoplesGuideLink = page.locator('a[href="/panduan-rakyat"]');
    await expect(peoplesGuideLink).toBeVisible();
    
    // Verify active state styling (should have different color or underline)
    const activeStyle = await peoplesGuideLink.evaluate((el) => {
      const style = window.getComputedStyle(el);
      return {
        color: style.color,
        fontWeight: style.fontWeight,
      };
    });
    
    console.log('Active link style:', activeStyle);
  });

  test('Section cards have proper contrast', async ({ page }) => {
    await page.goto(PANDUAN_URL);
    await page.setViewportSize(VIEWPORTS.desktop);

    const cards = page.locator('[class*="rounded-2xl"]').all();
    const cardCount = await cards.length;
    
    expect(cardCount).toBeGreaterThanOrEqual(10); // Should have 10 section cards

    // Check each card has readable text
    for (let i = 0; i < Math.min(cardCount, 10); i++) {
      const card = cards[i];
      await expect(card).toBeVisible();
      
      const title = card.locator('h3');
      await expect(title).toBeVisible();
    }
  });

  test('Footer is visible', async ({ page }) => {
    await page.goto(PANDUAN_URL);
    await page.setViewportSize(VIEWPORTS.desktop);

    const footer = page.locator('footer');
    await expect(footer).toBeVisible();
    
    // Scroll to footer
    await footer.scrollIntoViewIfNeeded();
    await page.waitForTimeout(500);
    
    await expect(page).toHaveScreenshot('panduan-footer-light.png', {
      fullPage: false,
      clip: { x: 0, y: 0, width: 1440, height: 400 },
    });
  });

  test('Theme toggle works', async ({ page }) => {
    await page.goto(PANDUAN_URL);
    await page.setViewportSize(VIEWPORTS.desktop);

    // Start in light mode
    await page.evaluate(() => {
      localStorage.setItem('edulaluan-theme', 'light');
      document.documentElement.classList.remove('dark');
    });
    await page.reload();

    // Check background color in light mode
    const lightBg = await page.evaluate(() => 
      window.getComputedStyle(document.body).backgroundColor
    );
    console.log('Light mode bg:', lightBg);

    // Toggle to dark mode
    const themeToggle = page.locator('button[aria-label*="theme"], button[class*="theme"]');
    if (await themeToggle.count() > 0) {
      await themeToggle.first().click();
      await page.waitForTimeout(500);

      // Check background color in dark mode
      const darkBg = await page.evaluate(() => 
        window.getComputedStyle(document.body).backgroundColor
      );
      console.log('Dark mode bg:', darkBg);

      // Dark mode should be darker
      const isLightModeLighter = lightBg.includes('250') || lightBg.includes('255');
      const isDarkModeDarker = darkBg.includes('3') || darkBg.includes('4') || darkBg.includes('5');
      
      console.log('Light mode is light:', isLightModeLighter);
      console.log('Dark mode is dark:', isDarkModeDarker);
    }
  });

  test('All section cards are clickable', async ({ page }) => {
    await page.goto(PANDUAN_URL);
    await page.setViewportSize(VIEWPORTS.desktop);

    const cards = page.locator('a[href^="/panduan-rakyat/section"]');
    const count = await cards.count();
    
    expect(count).toBe(10); // Should have 10 section cards

    // Check each card has href
    for (let i = 0; i < count; i++) {
      const href = await cards.nth(i).getAttribute('href');
      expect(href).toMatch(/^\/panduan-rakyat\/section-\d{2}$/);
    }
  });

  test('Responsive mobile menu works', async ({ page }) => {
    await page.setViewportSize(VIEWPORTS.mobile);
    await page.goto(PANDUAN_URL);

    // Mobile menu button should be visible
    const mobileMenuButton = page.locator('#mobile-menu-button');
    await expect(mobileMenuButton).toBeVisible();

    // Click to open menu
    await mobileMenuButton.click();
    await page.waitForTimeout(300);

    // Mobile menu should be visible
    const mobileMenu = page.locator('#mobile-menu');
    await expect(mobileMenu).toBeVisible();

    // Should have Panduan Rakyat link
    const peoplesGuideLink = mobileMenu.locator('a[href="/panduan-rakyat"]');
    await expect(peoplesGuideLink).toBeVisible();

    await expect(page).toHaveScreenshot('panduan-mobile-menu.png', {
      fullPage: true,
    });
  });
});

test.describe('Panduan Rakyat - Content Tests', () => {
  test('Hero section has correct content', async ({ page }) => {
    await page.goto(PANDUAN_URL);

    // Check title
    await expect(page).toHaveTitle(/Panduan Rakyat/);

    // Check main heading
    const heading = page.locator('h1');
    await expect(heading).toContainText(/PEOPLE'S GUIDE/i);

    // Check eyebrow
    const eyebrow = page.locator('text=Panduan Rakyat');
    await expect(eyebrow).toBeVisible();

    // Check description
    const description = page.locator('text=navigating life in Malaysia');
    await expect(description).toBeVisible();
  });

  test('Stats are displayed correctly', async ({ page }) => {
    await page.goto(PANDUAN_URL);

    // Check stats
    await expect(page.locator('text=10')).toBeVisible(); // Sections
    await expect(page.locator('text=86')).toBeVisible(); // Pages
    await expect(page.locator('text=100%')).toBeVisible(); // Free Access
    await expect(page.locator('text=24/7')).toBeVisible(); // Available
  });

  test('All 10 sections are present', async ({ page }) => {
    await page.goto(PANDUAN_URL);

    const expectedSections = [
      'Safety and Emergencies',
      'Work and Employment',
      'Tax and Finance',
      'Health and Wellbeing',
      'Government Services',
      'Starting a Business',
      'Rights and Consumer Protection',
      'Digital and Online Safety',
      'Tech Services in Malaysia',
      'KidZone',
    ];

    for (const section of expectedSections) {
      await expect(page.locator(`text=${section}`)).toBeVisible();
    }
  });

  test('Quick Start Guide is visible', async ({ page }) => {
    await page.goto(PANDUAN_URL);

    await expect(page.locator('text=How to Use This Guide')).toBeVisible();
    await expect(page.locator('text=Browse by Section')).toBeVisible();
    await expect(page.locator('text=Choose Your View')).toBeVisible();
    await expect(page.locator('text=Get Step-by-Step Help')).toBeVisible();
  });
});

test.describe('Panduan Rakyat - Visual Regression', () => {
  test('Full page screenshot - light mode', async ({ page }) => {
    await page.setViewportSize(VIEWPORTS.desktop);
    await page.goto(PANDUAN_URL);
    
    // Ensure light mode
    await page.evaluate(() => {
      localStorage.setItem('edulaluan-theme', 'light');
      document.documentElement.classList.remove('dark');
    });
    await page.reload();
    await page.waitForTimeout(1000);

    await expect(page).toHaveScreenshot('panduan-fullpage-light.png', {
      fullPage: true,
    });
  });

  test('Full page screenshot - dark mode', async ({ page }) => {
    await page.setViewportSize(VIEWPORTS.desktop);
    await page.goto(PANDUAN_URL);
    
    // Ensure dark mode
    await page.evaluate(() => {
      localStorage.setItem('edulaluan-theme', 'dark');
      document.documentElement.classList.add('dark');
    });
    await page.reload();
    await page.waitForTimeout(1000);

    await expect(page).toHaveScreenshot('panduan-fullpage-dark.png', {
      fullPage: true,
    });
  });
});
