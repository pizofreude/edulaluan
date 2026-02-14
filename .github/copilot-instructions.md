# EduLaluan - Copilot Instructions

This is a Malaysian education resource navigator built with Astro, React, and Tailwind CSS. It helps Malaysian families (B40/M40/T20 income groups) discover scholarships, courses, and financial aid.

## Build, Test, and Development

### Development
```bash
npm run dev        # Start dev server at http://localhost:4321
npm start          # Alias for npm run dev
```

### Build and Preview
```bash
npm run build      # Type-check with astro check, then build for production
npm run preview    # Preview production build locally
```

### Type Checking
```bash
npx astro check    # Run TypeScript checks on Astro files
```

No test suite is currently configured.

## Architecture Overview

### Islands Architecture (Astro)
- **Static-first**: Pages are `.astro` files that render to static HTML at build time
- **React islands**: Interactive components (`.tsx`) are hydrated only when needed using `client:*` directives
- **Content Collections**: Educational resources are JSON files validated by Zod schemas at build time

### Key Component Patterns
- **Astro components**: `Header.astro`, `Footer.astro`, `Hero.astro`, layout wrappers (server-rendered, no JS)
- **React islands**: `Navigator.tsx`, `ResourceCard.tsx`, `FilterBar.tsx` (client-side interactivity)
- **shadcn/ui**: Button, Card, Badge components in `src/components/ui/` using Tailwind + class-variance-authority

### Data Flow
1. Resources defined in `src/content/resources/*.json` (one file per resource)
2. Schema enforced by `src/content/config.ts` Zod schema
3. Pages fetch resources using `getCollection('resources')` from `astro:content`
4. Pass to React islands as props for filtering/display

### File Organization
```
src/
├── components/
│   ├── ui/              # shadcn/ui components (React)
│   ├── *.astro          # Static layout components
│   └── *.tsx            # Interactive React islands
├── content/
│   ├── config.ts        # Zod schemas for content collections
│   └── resources/       # JSON resource files
├── layouts/
│   └── Layout.astro     # Base HTML wrapper
├── pages/               # File-based routing (*.astro)
└── lib/utils.ts         # cn() helper for Tailwind merging
```

## Key Conventions

### Adding Resources
Create JSON files in `src/content/resources/` following the schema in `config.ts`:

```json
{
  "name": "Resource Name",
  "provider": "Organization",
  "description": "Brief description",
  "url": "https://...",
  "category": "scholarship",          // See schema for valid values
  "incomeGroups": ["B40", "M40"],     // Malaysian income brackets
  "cost": "free",
  "mode": "online",
  "language": ["en", "ms"],
  "tags": ["government", "stem"],
  "featured": false,
  "educationLevel": ["secondary"]
}
```

**Valid categories**: `scholarship`, `mooc`, `tvet`, `financial-aid`, `digital-skills`, `degree`, `secondary-education`, `elite-institutions`, `community`, `other`

**Note on elite-institutions**: Added in v1.1 for prestigious boarding schools (Eton, Le Rosey, Phillips Exeter) and top universities (Oxford, Stanford, Harvard) targeting M40+T20 families. These resources cost $50,000-$150,000+ annually but many offer substantial financial aid for international students.

**Note on secondary-education**: Added in v1.2 for Malaysian government Sekolah Berasrama Penuh (SBP) - fully residential secondary schools offering Form 1-5 education with minimal fees. 77 SBP schools included covering all states. Featured schools include MCKK (Eton of the East), INTEGOMB (#1 GPS 0.93), STF, TKC, SAS, SASER.

**Education levels** (optional field, aligned with Malaysian education system):
- `primary`: Primary school (Std 1-6, ages 7-12)
- `secondary`: Secondary school (Form 1-5, ages 13-17, SPM level)
- `post-secondary`: Form 6/STPM, matriculation, foundation, diploma programs
- `tertiary`: Degree programs (bachelor's, master's, PhD)
- `all-levels`: Resources suitable for all education levels

**Income groups** (Malaysian household income/month):
- `B40`: < RM4,850
- `M40`: RM4,850-10,970
- `T20`: > RM10,970

### Styling
- Use `cn()` utility from `@/lib/utils` to merge Tailwind classes
- shadcn/ui components use CSS variables defined in `src/styles/global.css`
- Custom colors: `malaysia-teal`, `malaysia-gold` (see `tailwind.config.mjs`)

### Importing Paths
TypeScript paths configured in `tsconfig.json`:
- `@/components` → `src/components`
- `@/lib/utils` → `src/lib/utils`

### React in Astro
When using React components in `.astro` files:
- Add `client:load` for immediate hydration
- Add `client:visible` for lazy loading when visible
- Add `client:idle` for low-priority hydration
- Pass props as you would in JSX (Astro will serialize them)
