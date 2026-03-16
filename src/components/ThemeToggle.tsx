import React, { useState, useEffect } from 'react';
import { toggleTheme, getTheme, createSparkleEffect, prefersReducedMotion } from '../lib/theme';

/**
 * ThemeToggle Component
 *
 * A polished theme toggle button with smooth animations and sparkle effects.
 * Inspired by tweakcn.com's theme toggle implementation.
 *
 * Features:
 * - Smooth sun/moon icon morphing animation
 * - Sparkle particle effect on toggle
 * - Keyboard accessible (Enter/Space)
 * - Proper accessibility attributes
 * - Respects reduced motion preference
 */
export const ThemeToggle: React.FC = () => {
  const [theme, setThemeState] = useState<'light' | 'dark'>('light');
  const [isAnimating, setIsAnimating] = useState(false);
  const [mounted, setMounted] = useState(false);
  const reducedMotion = prefersReducedMotion();

  // Sync with theme state on mount and when theme changes
  useEffect(() => {
    setMounted(true);
    setThemeState(getTheme());

    const handleThemeChange = (e: CustomEvent<{ theme: 'light' | 'dark' }>) => {
      setThemeState(e.detail.theme);
    };

    window.addEventListener('theme-change', handleThemeChange as EventListener);
    return () => window.removeEventListener('theme-change', handleThemeChange as EventListener);
  }, []);

  const handleToggle = () => {
    if (isAnimating && !reducedMotion) return;

    setIsAnimating(true);
    const newTheme = toggleTheme();
    setThemeState(newTheme);

    // Create sparkle effect
    if (!reducedMotion) {
      setTimeout(() => {
        setIsAnimating(false);
      }, 300);
    } else {
      setIsAnimating(false);
    }
  };

  const handleSparkle = (e: React.MouseEvent<HTMLButtonElement>) => {
    if (!reducedMotion) {
      createSparkleEffect(e.currentTarget);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLButtonElement>) => {
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault();
      e.stopPropagation();
      handleToggle();
    }
  };

  // Don't render until mounted to avoid hydration mismatch
  if (!mounted) {
    return (
      <button
        aria-label="Toggle theme"
        className="relative inline-flex items-center justify-center w-10 h-10 rounded-full bg-muted border border-border text-foreground"
        disabled
      >
        <div className="relative w-5 h-5">
          <svg className="absolute inset-0 w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
        </div>
      </button>
    );
  }

  return (
    <button
      onClick={(e) => {
        handleSparkle(e);
        handleToggle();
      }}
      onKeyDown={handleKeyDown}
      aria-label={`Switch to ${theme === 'light' ? 'dark' : 'light'} mode`}
      className={`
        relative inline-flex items-center justify-center
        w-10 h-10 rounded-full
        bg-muted hover:bg-muted/80
        border border-border
        text-foreground
        transition-all duration-200 ease-out
        focus:outline-none focus-visible:ring-2 focus-visible:ring-primary focus-visible:ring-offset-2
        hover:shadow-lg hover:scale-105
        active:scale-95
        theme-toggle-button
        ${isAnimating ? 'theme-animating' : ''}
      `}
      data-theme={theme}
    >
      {/* Icon container with rotation animation */}
      <div className="relative w-5 h-5 theme-icon-container">
        {/* Sun icon */}
        <svg
          className={`
            absolute inset-0 w-5 h-5
            transition-all duration-300 ease-out
            ${theme === 'light' ? 'opacity-100 rotate-0 scale-100' : 'opacity-0 -rotate-90 scale-75'}
          `}
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          aria-hidden="true"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"
          />
        </svg>

        {/* Moon icon */}
        <svg
          className={`
            absolute inset-0 w-5 h-5
            transition-all duration-300 ease-out
            ${theme === 'dark' ? 'opacity-100 rotate-0 scale-100' : 'opacity-0 rotate-90 scale-75'}
          `}
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          aria-hidden="true"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
          />
        </svg>
      </div>

      {/* Sparkle container - particles injected here */}
      <span className="sparkle-container" aria-hidden="true" />
    </button>
  );
};

export default ThemeToggle;
