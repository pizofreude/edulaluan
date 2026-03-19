import React, { useState, useEffect } from 'react';

interface TOCItem {
  id: string;
  title: string;
  level: number;
}

interface TableOfContentsProps {
  headings: TOCItem[];
  sectionColorRgb: string;
}

/**
 * TableOfContents Component for People's Guide Articles
 * Sticky sidebar with scroll tracking and section color accents
 */
export const TableOfContents: React.FC<TableOfContentsProps> = ({
  headings,
  sectionColorRgb,
}) => {
  const [activeId, setActiveId] = useState<string>('');

  // Track scroll position and update active heading
  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveId(entry.target.id);
          }
        });
      },
      { rootMargin: '-20% 0% -35% 0%' }
    );

    headings.forEach((heading) => {
      const element = document.getElementById(heading.id);
      if (element) {
        observer.observe(element);
      }
    });

    return () => observer.disconnect();
  }, [headings]);

  if (headings.length === 0) return null;

  return (
    <aside className="sticky top-24 hidden lg:block w-64 shrink-0">
      <nav className="space-y-1" aria-label="Table of contents">
        <h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-3">
          On This Page
        </h3>
        {headings.map((heading) => (
          <a
            key={heading.id}
            href={`#${heading.id}`}
            className={`block py-1.5 text-sm transition-all border-l-2 ${
              activeId === heading.id
                ? 'text-primary font-semibold'
                : 'text-muted-foreground hover:text-foreground'
            }`}
            style={{
              paddingLeft: `${(heading.level - 2) * 12 + 12}px`,
              borderColor: activeId === heading.id ? `rgb(${sectionColorRgb})` : 'transparent',
            }}
          >
            {heading.title}
          </a>
        ))}
      </nav>
    </aside>
  );
};

export default TableOfContents;
