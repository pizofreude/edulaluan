/**
 * Theme Management for EduLaluan
 * Handles theme switching, persistence, and sparkle effects
 */

export type Theme = 'light' | 'dark';

const THEME_STORAGE_KEY = 'edulaluan-theme';

/**
 * Get the current theme from localStorage or system preference
 */
export function getTheme(): Theme {
  if (typeof window === 'undefined') return 'light';
  
  const stored = localStorage.getItem(THEME_STORAGE_KEY) as Theme | null;
  if (stored) return stored;
  
  // Check system preference
  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    return 'dark';
  }
  
  return 'light';
}

/**
 * Set the theme and update the DOM
 */
export function setTheme(theme: Theme): void {
  if (typeof window === 'undefined') return;
  
  const html = document.documentElement;
  
  if (theme === 'dark') {
    html.classList.add('dark');
  } else {
    html.classList.remove('dark');
  }
  
  localStorage.setItem(THEME_STORAGE_KEY, theme);
  
  // Dispatch custom event for other components to listen
  window.dispatchEvent(new CustomEvent('theme-change', { detail: { theme } }));
}

/**
 * Toggle between light and dark themes
 */
export function toggleTheme(): Theme {
  const current = getTheme();
  const newTheme = current === 'light' ? 'dark' : 'light';
  setTheme(newTheme);
  return newTheme;
}

/**
 * Initialize theme on page load
 */
export function initTheme(): void {
  const theme = getTheme();
  setTheme(theme);
}

/**
 * Listen for system theme changes
 */
export function listenToSystemTheme(): () => void {
  const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
  
  const handler = (e: MediaQueryListEvent) => {
    const stored = localStorage.getItem(THEME_STORAGE_KEY);
    // Only auto-switch if user hasn't manually set a preference
    if (!stored) {
      setTheme(e.matches ? 'dark' : 'light');
    }
  };
  
  mediaQuery.addEventListener('change', handler);
  return () => mediaQuery.removeEventListener('change', handler);
}

/**
 * Create sparkle effect at button position
 */
export function createSparkleEffect(button: HTMLElement): void {
  const rect = button.getBoundingClientRect();
  const centerX = rect.left + rect.width / 2;
  const centerY = rect.top + rect.height / 2;
  
  // Create 8-12 sparkles
  const sparkleCount = 8 + Math.floor(Math.random() * 5);
  
  for (let i = 0; i < sparkleCount; i++) {
    createSparkle(centerX, centerY, i, sparkleCount);
  }
}

/**
 * Create a single sparkle particle
 */
function createSparkle(centerX: number, centerY: number, index: number, total: number): void {
  const sparkle = document.createElement('div');
  sparkle.className = 'theme-sparkle';
  
  // Random angle and distance
  const angle = (index / total) * Math.PI * 2;
  const distance = 40 + Math.random() * 40;
  
  // Calculate end position
  const endX = Math.cos(angle) * distance;
  const endY = Math.sin(angle) * distance;
  
  // Random size variation
  const size = 4 + Math.random() * 4;
  sparkle.style.width = `${size}px`;
  sparkle.style.height = `${size}px`;
  
  // Set initial position
  sparkle.style.left = `${centerX}px`;
  sparkle.style.top = `${centerY}px`;
  
  // Set CSS custom properties for animation
  sparkle.style.setProperty('--sparkle-end-x', `${endX}px`);
  sparkle.style.setProperty('--sparkle-end-y', `${endY}px`);
  sparkle.style.setProperty('--sparkle-delay', `${index * 30}ms`);
  
  document.body.appendChild(sparkle);
  
  // Remove after animation completes
  setTimeout(() => {
    sparkle.remove();
  }, 600);
}

/**
 * Check if reduced motion is preferred
 */
export function prefersReducedMotion(): boolean {
  if (typeof window === 'undefined') return false;
  return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
}
