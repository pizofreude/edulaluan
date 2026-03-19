import React from 'react';

interface SectionCardProps {
  slug: string;
  title: string;
  description: string;
  page_count: number;
  colorRgb: string;
  icon: string;
}

const SectionCard: React.FC<SectionCardProps> = ({
  slug,
  title,
  description,
  page_count,
  colorRgb,
  icon,
}) => {
  return (
    <a
      href={`/panduan-rakyat/${slug}`}
      className="group block h-full"
      style={{ '--section-color': `rgb(${colorRgb})` } as React.CSSProperties}
    >
      <div
        className="relative h-full overflow-hidden rounded-2xl border-2 bg-surface-elevated transition-all duration-300 hover:shadow-xl hover:-translate-y-1"
        style={{
          borderColor: `rgb(${colorRgb})`,
        }}
      >
        {/* Batik-inspired corner accent */}
        <div
          className="absolute top-0 right-0 h-16 w-16 opacity-30 transition-opacity group-hover:opacity-50"
          style={{
            background: `radial-gradient(circle at top right, rgb(${colorRgb}) 0%, transparent 70%)`,
          }}
        />

        <div className="p-6">
          {/* Icon */}
          <div
            className="mb-4 flex h-14 w-14 items-center justify-center rounded-xl text-3xl"
            style={{
              backgroundColor: `rgb(${colorRgb})`,
              color: 'white',
            }}
          >
            {icon}
          </div>

          {/* Title */}
          <h3
            className="mb-2 text-xl font-bold"
            style={{
              color: `rgb(${colorRgb})`,
            }}
          >
            {title}
          </h3>

          {/* Description */}
          <p className="mb-4 text-sm text-muted-foreground">{description}</p>

          {/* Page count badge */}
          <div className="flex items-center justify-between">
            <span
              className="inline-flex items-center rounded-full px-3 py-1 text-xs font-medium"
              style={{
                backgroundColor: `rgb(${colorRgb})`,
                color: 'white',
              }}
            >
              {page_count} {page_count === 1 ? 'page' : 'pages'}
            </span>
            <span
              className="text-sm font-medium transition-transform group-hover:translate-x-1"
              style={{
                color: `rgb(${colorRgb})`,
              }}
            >
              Explore →
            </span>
          </div>
        </div>

        {/* Bottom accent bar */}
        <div
          className="h-1 w-full"
          style={{
            backgroundColor: `rgb(${colorRgb})`,
          }}
        />
      </div>
    </a>
  );
};

export default SectionCard;
