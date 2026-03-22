/**
 * Username Validation Library
 * EduLaluan - Privacy-Preserving User Identity System
 * 
 * Rules:
 * - 3 to 30 characters
 * - Must start with a letter (a-z, A-Z)
 * - Can contain letters, numbers, and underscores only
 * - Case-insensitive uniqueness
 * - Can be changed once per 90 days
 */

export const USERNAME_RULES = {
  MIN_LENGTH: 3,
  MAX_LENGTH: 30,
  COOLDOWN_DAYS: 90,
  PATTERN: /^[a-zA-Z][a-zA-Z0-9_]*$/, // Must start with letter, alphanumeric + underscore
} as const;

// Reserved usernames (should match database reserved_usernames table)
export const RESERVED_USERNAMES = [
  // System & Administrative
  'admin',
  'administrator',
  'superadmin',
  'moderator',
  'system',
  'root',
  'sysop',
  'support',
  'help',
  'service',
  // Brand & Product
  'edulaluan',
  'edulaluan_team',
  'edulaluan_official',
  'krackathon',
  'godamsahur',
  // Confusion Prevention
  'null',
  'undefined',
  'anonymous',
  'unknown',
  'deleted',
  'removed',
  // Common
  'user',
  'guest',
  'visitor',
  'member',
  'test',
  'testing',
  'demo',
  'example',
  // Malaysian Cultural
  'datuk',
  'tan_sri',
  'tun',
  'sultan',
  'raja',
] as const;

export interface UsernameValidationResult {
  valid: boolean;
  error?: string;
  suggestions?: string[];
}

/**
 * Validate username format and rules
 */
export function validateUsername(username: string): UsernameValidationResult {
  if (!username || username.trim().length === 0) {
    return { 
      valid: false, 
      error: 'Username is required' 
    };
  }

  // Trim and check
  const trimmed = username.trim();

  if (trimmed.length < USERNAME_RULES.MIN_LENGTH) {
    return { 
      valid: false, 
      error: `Username must be at least ${USERNAME_RULES.MIN_LENGTH} characters` 
    };
  }

  if (trimmed.length > USERNAME_RULES.MAX_LENGTH) {
    return { 
      valid: false, 
      error: `Username must be no more than ${USERNAME_RULES.MAX_LENGTH} characters` 
    };
  }

  if (!USERNAME_RULES.PATTERN.test(trimmed)) {
    return { 
      valid: false, 
      error: 'Username can only contain letters, numbers, and underscores, and must start with a letter' 
    };
  }

  // Check reserved usernames (case-insensitive)
  const lowerUsername = trimmed.toLowerCase();
  if (RESERVED_USERNAMES.includes(lowerUsername as any)) {
    return { 
      valid: false, 
      error: 'This username is reserved and cannot be used' 
    };
  }

  // Check for profanity/inappropriate content (basic check)
  const inappropriatePatterns = [
    /shit/i,
    /fuck/i,
    /bitch/i,
    /asshole/i,
    /damn/i,
  ];
  
  for (const pattern of inappropriatePatterns) {
    if (pattern.test(trimmed)) {
      return { 
        valid: false, 
        error: 'Username contains inappropriate content',
        suggestions: generateSuggestions(trimmed, 'inappropriate')
      };
    }
  }

  return { valid: true };
}

/**
 * Check if username is available (database check required separately)
 * This does client-side validation only
 */
export function isUsernameAvailableLocally(username: string): UsernameValidationResult {
  return validateUsername(username);
}

/**
 * Calculate cooldown expiration date
 */
export function calculateCooldownExpiration(lastUpdatedAt: Date | string): Date {
  const lastUpdate = new Date(lastUpdatedAt);
  const cooldownMs = USERNAME_RULES.COOLDOWN_DAYS * 24 * 60 * 60 * 1000;
  return new Date(lastUpdate.getTime() + cooldownMs);
}

/**
 * Check if user can change username (cooldown check)
 */
export function canChangeUsername(
  lastUpdatedAt: Date | string | null,
  checkDate: Date = new Date()
): { canChange: boolean; daysRemaining?: number } {
  if (!lastUpdatedAt) {
    // Never changed before, can set
    return { canChange: true };
  }

  const lastUpdate = new Date(lastUpdatedAt);
  const cooldownMs = USERNAME_RULES.COOLDOWN_DAYS * 24 * 60 * 60 * 1000;
  const now = checkDate.getTime();
  const timeSinceUpdate = now - lastUpdate.getTime();

  if (timeSinceUpdate >= cooldownMs) {
    return { canChange: true };
  }

  const daysRemaining = Math.ceil(
    (cooldownMs - timeSinceUpdate) / (24 * 60 * 60 * 1000)
  );

  return { 
    canChange: false, 
    daysRemaining 
  };
}

/**
 * Generate username suggestions when desired username is taken
 */
export function generateSuggestions(
  baseUsername: string, 
  reason: 'taken' | 'inappropriate' | 'reserved' = 'taken'
): string[] {
  const suggestions: string[] = [];
  const clean = baseUsername.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();

  if (reason === 'inappropriate') {
    // Just return generic alternatives
    return [
      `${clean}_user`,
      `user_${clean}`,
      `${clean}123`,
    ].slice(0, 3);
  }

  // For taken/reserved, suggest variations
  const randomNum = Math.floor(Math.random() * 1000);
  
  suggestions.push(
    `${clean}${randomNum}`,
    `${clean}_${randomNum}`,
    `${clean}official`,
    `the${clean}`,
    `${clean}my`,
  );

  // Add year-based suggestions
  const year = new Date().getFullYear();
  suggestions.push(`${clean}${year}`);

  return suggestions.slice(0, 5);
}

/**
 * Normalize username (for storage - lowercase)
 */
export function normalizeUsername(username: string): string {
  return username.trim().toLowerCase();
}

/**
 * Display username (preserve case for display)
 */
export function displayUsername(username: string | null, fallback: string = 'Anonymous'): string {
  if (!username) return fallback;
  return username;
}

/**
 * Get username with @ prefix for social contexts
 */
export function usernameWithAt(username: string | null): string {
  if (!username) return '@anonymous';
  return `@${username}`;
}

/**
 * Truncate username for tight spaces
 */
export function truncateUsername(username: string, maxLength: number = 12): string {
  if (!username || username.length <= maxLength) return username;
  return `${username.slice(0, maxLength - 3)}...`;
}
