/**
 * Batik-Inspired Decorative Patterns
 * Modern Malaysian geometric motifs for subtle accents
 * 
 * Usage: Import and use as background patterns or section dividers
 * Keep usage sparse - these are accent elements, not main content
 */

/**
 * Pattern 1: Simple Diamond Grid
 * Inspired by traditional batik "corak ketupat" (diamond pattern)
 * Use for: Section backgrounds, subtle texture
 */
export const DiamondGridPattern = () => (
  <svg
    width="100%"
    height="100%"
    viewBox="0 0 100 100"
    preserveAspectRatio="xMidYMid slice"
    xmlns="http://www.w3.org/2000/svg"
    aria-hidden="true"
    className="opacity-10"
  >
    <defs>
      <pattern
        id="diamondGrid"
        x="0"
        y="0"
        width="20"
        height="20"
        patternUnits="userSpaceOnUse"
      >
        <path
          d="M10 0 L20 10 L10 20 L0 10 Z"
          fill="none"
          stroke="currentColor"
          strokeWidth="0.5"
        />
      </pattern>
    </defs>
    <rect width="100%" height="100%" fill="url(#diamondGrid)" />
  </svg>
);

/**
 * Pattern 2: Flowing Wave
 * Inspired by batik "corak awan larat" (cloud motif)
 * Represents continuity and growth in education
 * Use for: Section dividers, hero accents
 */
export const FlowingWavePattern = () => (
  <svg
    width="100%"
    height="100%"
    viewBox="0 0 200 40"
    preserveAspectRatio="none"
    xmlns="http://www.w3.org/2000/svg"
    aria-hidden="true"
  >
    <path
      d="M0 20 Q25 0 50 20 T100 20 T150 20 T200 20"
      fill="none"
      stroke="currentColor"
      strokeWidth="1"
      className="opacity-20"
    />
    <path
      d="M0 25 Q25 5 50 25 T100 25 T150 25 T200 25"
      fill="none"
      stroke="currentColor"
      strokeWidth="0.5"
      className="opacity-10"
    />
  </svg>
);

/**
 * Pattern 3: Geometric Star
 * Inspired by Islamic geometric patterns in Malaysian culture
 * Represents excellence and achievement
 * Use for: Featured resource accents, milestone markers
 */
export const GeometricStarPattern = ({ size = 24 }) => (
  <svg
    width={size}
    height={size}
    viewBox="0 0 24 24"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
    aria-hidden="true"
  >
    <path
      d="M12 0 L14.5 9.5 L24 12 L14.5 14.5 L12 24 L9.5 14.5 L0 12 L9.5 9.5 Z"
      fill="currentColor"
      className="opacity-15"
    />
    <circle cx="12" cy="12" r="3" fill="currentColor" className="opacity-25" />
  </svg>
);

/**
 * Pattern 4: Leaf Motif
 * Inspired by batik "corak daun" (leaf pattern)
 * Represents growth and learning
 * Use for: Educational content accents, progress indicators
 */
export const LeafMotifPattern = ({ size = 32 }) => (
  <svg
    width={size}
    height={size}
    viewBox="0 0 32 32"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
    aria-hidden="true"
  >
    <path
      d="M16 2 C16 2 8 10 8 18 C8 24 12 28 16 30 C20 28 24 24 24 18 C24 10 16 2 16 2 Z"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.5"
      className="opacity-20"
    />
    <path
      d="M16 6 L16 26"
      stroke="currentColor"
      strokeWidth="1"
      className="opacity-15"
    />
    <path
      d="M16 12 L20 14"
      stroke="currentColor"
      strokeWidth="0.75"
      className="opacity-15"
    />
    <path
      d="M16 18 L12 20"
      stroke="currentColor"
      strokeWidth="0.75"
      className="opacity-15"
    />
  </svg>
);

/**
 * Pattern 5: Divider Line
 * Simple decorative divider with cultural motif
 * Use for: Section separators, content dividers
 */
export const DecorativeDivider = () => (
  <div className="flex items-center justify-center gap-3 my-8" aria-hidden="true">
    <div className="h-px w-16 bg-gradient-to-r from-transparent to-primary/30" />
    <GeometricStarPattern size={16} />
    <div className="h-px w-16 bg-gradient-to-l from-transparent to-primary/30" />
  </div>
);

/**
 * CSS Pattern Classes
 * Apply these to elements for batik-inspired backgrounds
 */
export const batikPatternCSS = `
/* Diamond grid background */
.bg-batik-diamond {
  background-image: url("data:image/svg+xml,%3Csvg width='20' height='20' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M10 0 L20 10 L10 20 L0 10 Z' fill='none' stroke='currentColor' stroke-width='0.5' opacity='0.1'/%3E%3C/svg%3E");
}

/* Wave pattern background */
.bg-batik-wave {
  background-image: url("data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0 20 Q10 10 20 20 T40 20' fill='none' stroke='currentColor' stroke-width='1' opacity='0.1'/%3E%3C/svg%3E");
  background-size: 40px 40px;
}

/* Subtle dot pattern (modern interpretation) */
.bg-batik-dot {
  background-image: radial-gradient(currentColor 1px, transparent 1px);
  background-size: 8px 8px;
  opacity: 0.15;
}
`;
