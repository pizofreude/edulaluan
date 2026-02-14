# Product Requirements Document (PRD)
## EduLaluan - Smart Education Resource Navigator

---

### Document Information
- **Product Name**: EduLaluan
- **Version**: 1.2
- **Last Updated**: February 2026
- **Status**: Released
- **Product Owner**: EduLaluan Team
- **Engineering Lead**: EduLaluan Team

---

## 1. Product Overview

### 1.1 Vision Statement
To become the go-to platform for Malaysian families seeking educational opportunities, making education accessible regardless of economic circumstances through intelligent resource discovery.

### 1.2 Product Description
EduLaluan is a static web application that helps Malaysian families discover educational resources (scholarships, courses, training programs) through an intuitive smart navigator and powerful filtering system. Built with Astro and React, it provides a fast, mobile-first experience with 146+ curated resources spanning from government boarding schools (SBP) to elite international institutions.

**Version History**:
- **v1.0**: Initial release with 40 resources, basic filtering
- **v1.1**: Added 28 elite international institutions (boarding schools & universities), expanded to 6 multicultural personas
- **v1.2**: Added 77 Malaysian SBP schools, education level filtering system, 146 total resources

### 1.3 Target Users

#### Primary Persona: "Siti" - B40 Bumiputera Student Seeking Opportunities
- **Age**: 17, SPM graduate from Kedah
- **Ethnicity**: Malay (Bumiputera)
- **Income Bracket**: B40 (household income RM3,500/month)
- **Goals**: Find free or subsidized higher education options, especially Bumiputera scholarships
- **Pain Points**: Unaware of available government scholarships, overwhelmed by options, limited family guidance on higher education
- **Tech Proficiency**: Comfortable with smartphone apps, basic web browsing
- **Usage Pattern**: Mobile-first, quick sessions during commute or at home
- **Language Preference**: Bahasa Malaysia primary, some English

#### Secondary Persona: "Lee Wei Ming" - M40 Chinese Parent Planning Children's Education
- **Age**: 38, small business owner in Penang
- **Ethnicity**: Chinese Malaysian
- **Income Bracket**: M40 (household income RM8,200/month)
- **Goals**: Research STEM programs and international MOOCs for two children, explore technical training options
- **Pain Points**: Balancing business and research time, wants value-for-money education investments, concerned about competitiveness
- **Tech Proficiency**: High, uses multiple devices throughout the day
- **Usage Pattern**: Evening and weekend research sessions, bookmarks and compares multiple options
- **Language Preference**: English primary, some Mandarin resources

#### Tertiary Persona: "Kumar" - M40 Indian Parent Planning Child's Education
- **Age**: 42, working professional in Kuala Lumpur
- **Ethnicity**: Indian Malaysian (Tamil)
- **Income Bracket**: M40 (household income RM7,800/month)
- **Goals**: Explore degree programs and professional certifications for teenage son
- **Pain Points**: Time-constrained with work, wants clear eligibility criteria, seeks balance of quality and affordability
- **Tech Proficiency**: Moderate, uses desktop and mobile
- **Usage Pattern**: Evening research sessions after work, systematic comparison approach
- **Language Preference**: English primary

#### Quaternary Persona: "Ahmad Danial" - T20 Bumiputera Student Seeking Excellence
- **Age**: 19, foundation student in private university
- **Ethnicity**: Malay (Bumiputera)
- **Income Bracket**: T20 (household income RM15,000/month)
- **Goals**: Find competitive merit-based scholarships and premium MOOCs for overseas study preparation
- **Pain Points**: Needs curated high-quality resources, not just quantity; wants to maximize opportunities beyond income-based aid
- **Tech Proficiency**: High, expects modern UX and fast performance
- **Usage Pattern**: Desktop browsing, explores multiple categories, research-oriented
- **Language Preference**: English primary, confident in Bahasa Malaysia

#### Fifth Persona: "Sarah Julan" - B40 Indigenous Student from Sabah
- **Age**: 18, SPM graduate from Kota Kinabalu
- **Ethnicity**: Kadazan-Dusun (Bumiputera Sabah)
- **Income Bracket**: B40 (household income RM3,200/month)
- **Goals**: Access TVET programs and digital skills training, explore scholarships for indigenous students from Sabah
- **Pain Points**: Limited awareness of Sabah-specific programs, internet connectivity challenges in rural areas, needs offline-friendly resources
- **Tech Proficiency**: Moderate smartphone use, limited data availability
- **Usage Pattern**: Mobile-only, downloads information when has WiFi access, evening browsing
- **Language Preference**: Bahasa Malaysia primary, basic English, some Kadazan

#### Sixth Persona: "James Anak Mering" - M40 Indigenous Parent from Sarawak
- **Age**: 35, civil servant in Kuching
- **Ethnicity**: Iban (Bumiputera Sarawak)
- **Income Bracket**: M40 (household income RM6,500/month)
- **Goals**: Find vocational training and community programs for children in rural Sarawak, explore online learning due to distance
- **Pain Points**: Geographic isolation from major education centers, needs flexible online/hybrid options, wants Sarawak-specific resources
- **Tech Proficiency**: Moderate, familiar with government portals and basic web navigation
- **Usage Pattern**: Weekend research when back in longhouse with family, prefers mobile-friendly sites
- **Language Preference**: Bahasa Malaysia and English equally, some Iban

---

## 2. Product Goals and Success Metrics

### 2.1 Product Goals
1. **Discovery**: Enable users to find 3-5 relevant resources within 2 minutes
2. **Coverage**: Provide comprehensive coverage across 6+ education categories
3. **Accessibility**: Ensure platform is usable by all Malaysians regardless of device or ability
4. **Maintainability**: Allow non-technical contributors to add resources easily

### 2.2 Key Performance Indicators (KPIs)

| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| Average Time to First Resource | < 60 seconds | Analytics |
| Navigator Completion Rate | > 60% | Funnel analysis |
| Mobile Traffic Percentage | > 70% | Device analytics |
| Resources Per Session | > 5 views | Page view tracking |
| Return Visitor Rate | > 30% | Cookie-based tracking |

### 2.3 Success Criteria
- ✅ All features functional on mobile and desktop
- ✅ 68+ resources across 9 categories (including elite-institutions as of v1.1)
- ✅ < 2 second page load time
- ✅ Lighthouse score > 90
- ✅ Zero critical accessibility issues

---

## 3. Features and Requirements

### 3.1 Feature: Smart Navigator

#### Description
A 3-step wizard that guides users through income bracket selection and goal identification to provide personalized resource recommendations.

#### User Story
```
As a Malaysian student/parent,
I want to answer simple questions about my situation,
So that I can quickly find relevant educational resources without being overwhelmed.
```

#### Functional Requirements

**FR-NAV-1: Step 1 - Income Group Selection**
- **Input**: User selects one of 4 options:
  - B40 (< RM4,850/month)
  - M40 (RM4,850-10,970/month)
  - T20 (> RM10,970/month)
  - Not sure (shows all resources)
- **Display**: Clear income range descriptions for each bracket
- **Behavior**: Auto-advance to Step 2 on selection
- **Validation**: Selection required to proceed

**FR-NAV-2: Step 2 - Goal Selection**
- **Input**: User selects educational goal:
  - Scholarships
  - Free Courses
  - Skills Training
  - Financial Aid
  - Degree Programs
- **Display**: Goal names only (self-explanatory)
- **Behavior**: Auto-advance to Step 3 on selection
- **Navigation**: "Back" button to return to Step 1

**FR-NAV-3: Step 3 - Results Display**
- **Output**: Filtered list of matching resources
- **Display Elements**:
  - Result count: "Found X resources for [Income Group] - [Goal]"
  - Active filters shown as badges
  - Resource cards in grid layout (2 columns on desktop, 1 on mobile)
- **Actions**:
  - "Back" button to modify goal
  - "Start Over" button to reset wizard
- **Edge Case**: Show helpful message if 0 results found

**FR-NAV-4: Progress Indicator**
- **Display**: Visual stepper showing 3 steps
  - Step indicators numbered 1-3
  - Active step highlighted in teal
  - Completed steps filled in
  - Progress line connecting steps
- **Labels**: "Income Group" → "Your Goal" → "Results"

#### Technical Specifications
- **Component**: `Navigator.tsx` (React)
- **State Management**: React useState hooks
- **Props**: `resources: Resource[]` from Astro Content Collections
- **Filtering Logic**:
  ```typescript
  1. Filter by category based on goal mapping
  2. Filter by income group (if not "Not sure")
  3. Return matching resources
  ```
- **Category Mapping**:
  - Scholarships → ['scholarship']
  - Free Courses → ['mooc']
  - Skills Training → ['digital-skills', 'tvet']
  - Financial Aid → ['financial-aid']
  - Degree Programs → ['degree']

#### Design Requirements
- Mobile-first responsive design
- Card-based selection interface with hover states
- Teal accent color (#0d9488) for active states
- Maximum width: 1024px (centered)
- Touch-friendly buttons (min 44px height)

#### Acceptance Criteria
- [ ] User can complete flow in 3 clicks
- [ ] Back button works at each step
- [ ] Results update immediately after selections
- [ ] Mobile layout works on 360px screens
- [ ] Keyboard navigation supported
- [ ] Screen reader announces step changes

---

### 3.2 Feature: Resource Database

#### Description
Structured content collection of 40+ educational resources with schema validation, stored as JSON files.

#### User Story
```
As a user,
I want to access a comprehensive database of Malaysian education resources,
So that I have one place to discover all available opportunities.
```

#### Functional Requirements

**FR-RES-1: Resource Schema**
- **Required Fields**:
  - `name`: Resource title (string, 5-100 chars)
  - `provider`: Organization name (string)
  - `description`: Detailed description (string, 100-500 chars)
  - `url`: Direct link (valid URL)
  - `category`: One of 10 categories (enum)
  - `incomeGroups`: Array of applicable brackets (B40/M40/T20)
  - `cost`: free | subsidized | paid
  - `mode`: online | in-person | hybrid
  - `language`: Array of language codes (en/ms/zh/ta)
  - `tags`: Array of descriptive tags (string[])
  - `featured`: Boolean flag for homepage display
  - `educationLevel`: Optional array of education levels (primary/secondary/post-secondary/tertiary/all-levels) - added v1.2

**FR-RES-2: Category Taxonomy**
- **Categories** (must select exactly one):
  1. `scholarship` - Government, corporate, NGO scholarships
  2. `mooc` - Massive Open Online Courses (Coursera, edX, etc.)
  3. `tvet` - Technical and Vocational Education and Training
  4. `financial-aid` - Loan programs, grants, subsidies
  5. `digital-skills` - Coding bootcamps, tech skills training
  6. `degree` - University programs, foundation programs
  7. `secondary-education` - Malaysian government boarding schools (SBP) - added v1.2
  8. `elite-institutions` - Prestigious boarding schools and top universities (added v1.1)
  9. `community` - Community-driven education initiatives
  10. `other` - Resources that don't fit other categories

**FR-RES-3: Income Group Applicability**
- Resources must specify at least one income group
- Multiple groups allowed (e.g., [B40, M40])
- Use case:
  - PTPTN (student loans): [B40, M40, T20] (all groups)
  - Free tertiary for B40: [B40] (only B40)
  - Premium scholarships: [T20] (competitive, not income-restricted)
  - SBP schools: [B40, M40] (subsidized government boarding schools)

**FR-RES-4: Education Level Filtering** (added v1.2)
- **Optional field** that categorizes resources by Malaysian education system level
- **Education levels** (array, can have multiple):
  - `primary`: Primary school (Std 1-6, ages 7-12)
  - `secondary`: Secondary school (Form 1-5, ages 13-17, SPM)
  - `post-secondary`: Form 6/STPM, matriculation, foundation, diploma
  - `tertiary`: Degree programs (bachelor's, master's, PhD)
  - `all-levels`: Resources suitable for all education levels
- **Use cases**:
  - SBP schools: `["secondary"]`
  - Khan Academy: `["primary", "secondary", "post-secondary"]`
  - Scholarships: Varies by program (e.g., `["tertiary"]` for degree scholarships)
  - MOOCs: Often `["post-secondary", "tertiary"]`
  - Digital skills: Often `["secondary", "post-secondary", "tertiary"]`
- **FilterBar Integration**: Dropdown to filter resources by education level
- **Navigator Integration**: "Secondary Education" goal added for SBP schools

**FR-RES-5: Featured Resources**
- Up to 6 resources can be marked `featured: true`
- Featured resources appear on homepage
- Selection criteria: High impact, widely applicable, reputable providers

#### Technical Specifications
- **Storage**: `src/content/resources/*.json` (one file per resource)
- **Schema Enforcement**: Zod validation in `src/content/config.ts`
- **Build-Time Validation**: Astro checks all resources during `npm run build`
- **Access Pattern**: `getCollection('resources')` in Astro pages
- **Example Resource**:
```json
{
  "name": "PTPTN Education Loan",
  "provider": "Perbadanan Tabung Pendidikan Tinggi Nasional",
  "description": "Government education loan for Malaysian students pursuing higher education at approved institutions. Offers flexible repayment with low interest rates.",
  "url": "https://www.ptptn.gov.my",
  "category": "financial-aid",
  "incomeGroups": ["B40", "M40", "T20"],
  "cost": "subsidized",
  "mode": "hybrid",
  "language": ["en", "ms"],
  "tags": ["government", "loan", "higher-education"],
  "featured": true
}
```

#### Content Guidelines
- **Descriptions**: Focus on eligibility, benefits, and unique value
- **URLs**: Always link to official source (no affiliate links)
- **Tags**: Use lowercase, hyphenated format (e.g., "government-funded")
- **Verification**: All resources verified before adding

#### Acceptance Criteria
- [ ] Minimum 40 resources curated
- [ ] All categories have at least 3 resources
- [ ] Schema validation passes for all resources
- [ ] Featured resources display correctly on homepage
- [ ] URLs are active and correct

---

### 3.3 Feature: Advanced Filtering

#### Description
Multi-criteria filter interface for power users who want precise control over resource discovery.

#### User Story
```
As an experienced user,
I want to filter resources by multiple criteria simultaneously,
So that I can quickly find specific types of resources (e.g., free online scholarships for B40).
```

#### Functional Requirements

**FR-FLT-1: Search Input**
- **Field**: Text input with placeholder "Search resources..."
- **Behavior**: Real-time filtering as user types
- **Search Scope**: name, provider, description, tags
- **Search Logic**: Case-insensitive substring match
- **Performance**: Debounce at 300ms to prevent lag

**FR-FLT-2: Category Filter**
- **Field**: Dropdown select
- **Options**: 
  - All Categories (default)
  - Scholarships
  - MOOCs
  - TVET
  - Financial Aid
  - Digital Skills
  - Degree Programs
  - Community
  - Other
- **Behavior**: Show only resources matching selected category

**FR-FLT-3: Income Group Filter**
- **Field**: Dropdown select
- **Options**:
  - All Groups (default)
  - B40
  - M40
  - T20
- **Behavior**: Show only resources applicable to selected group

**FR-FLT-4: Cost Filter**
- **Field**: Dropdown select
- **Options**:
  - All Costs (default)
  - Free
  - Subsidized
  - Paid
- **Behavior**: Filter by resource cost type

**FR-FLT-5: Active Filters Display**
- **Display**: Badge pills showing active filters
- **Example**: "Search: 'coding'" "Category: digital-skills" "Income: B40"
- **Action**: Click badge to remove individual filter

**FR-FLT-6: Clear All Button**
- **Display**: Only shown when filters are active
- **Action**: Reset all filters to default state
- **Position**: Top-right of filter bar

**FR-FLT-7: Results Counter**
- **Display**: "Showing X resources" at bottom of filter bar
- **Updates**: Real-time as filters change

#### Technical Specifications
- **Component**: `FilterBar.tsx` (React)
- **State Management**: Local state with useEffect
- **Props**: `onFilterChange(filters)`, `totalResults: number`
- **Filter Combination**: AND logic (all filters must match)
- **Performance**: Client-side filtering (no API calls)

#### Design Requirements
- Responsive grid: 4 columns on desktop, 2 on tablet, 1 on mobile
- Consistent dropdown styling with shadcn/ui Select
- Subtle border and padding to separate from results
- Clear visual feedback for active filters

#### Acceptance Criteria
- [ ] All filters work independently and in combination
- [ ] Results update immediately on filter change
- [ ] Clear All resets to show all resources
- [ ] Active filters display correctly
- [ ] Search is case-insensitive
- [ ] Mobile layout is usable

---

### 3.4 Feature: Resource Display

#### Description
Consistent, accessible card-based display of resource information.

#### User Story
```
As a user,
I want to see key information about each resource at a glance,
So that I can quickly evaluate if it's relevant to my needs.
```

#### Functional Requirements

**FR-DSP-1: Resource Card Layout**
- **Structure**:
  - Header: Resource name (h3) + Provider (subtitle)
  - Body: Description (2-3 line truncation)
  - Footer: Badges and action button
- **Badges**:
  - Income groups (B40/M40/T20) in green
  - Category in blue
  - Cost (Free/Subsidized/Paid) in gray
  - Mode (Online/In-Person/Hybrid) in purple
- **Action**: "Learn More →" button linking to resource URL

**FR-DSP-2: Grid Layout**
- **Desktop**: 2 columns, gap 24px
- **Tablet**: 2 columns, gap 16px
- **Mobile**: 1 column, gap 16px
- **Maximum Width**: 1200px centered

**FR-DSP-3: External Links**
- **Behavior**: All resource links open in new tab (`target="_blank"`)
- **Security**: Include `rel="noopener noreferrer"`
- **Icon**: Arrow icon (→) to indicate external link

**FR-DSP-4: Empty State**
- **Trigger**: No resources match current filters
- **Display**: 
  - Centered card with helpful message
  - "Try adjusting your filters" suggestion
  - "Clear Filters" button

#### Technical Specifications
- **Component**: `ResourceCard.tsx` (React)
- **Props**: `resource: ResourceData`
- **Card Component**: shadcn/ui Card with Header, Content, Footer
- **Badge Component**: shadcn/ui Badge with variant styling

#### Design Requirements
- Card hover effect: subtle shadow and border color change
- Consistent padding: 20px on all sides
- Typography hierarchy: Name (18px bold), Provider (14px gray), Description (14px)
- Button: Full-width, teal background, white text
- Responsive images/icons if added later

#### Acceptance Criteria
- [ ] All resource data displays correctly
- [ ] Links open in new tab securely
- [ ] Cards are responsive and touch-friendly
- [ ] Empty state shows when no results
- [ ] Hover states work on desktop
- [ ] Badge colors follow design system

---

### 3.5 Feature: Landing Page

#### Description
Engaging homepage with hero section, stats, and featured resources to drive navigation.

#### Functional Requirements

**FR-HOME-1: Hero Section**
- **Headline**: "Find Your Education Path" (h1)
- **Subheadline**: Value proposition (1-2 sentences)
- **CTA Buttons**:
  - Primary: "Start Navigator" → /navigate
  - Secondary: "Browse Resources" → /resources
- **Visual**: Gradient background with Malaysian color themes

**FR-HOME-2: Stats Section**
- **Display**: 3 stat cards showing:
  - Total resources count (40+)
  - Category count (6+)
  - User-friendly label ("Free Options Available")
- **Style**: Teal numbers, gray labels, centered layout

**FR-HOME-3: Featured Resources**
- **Display**: 6 featured resources in grid
- **Heading**: "Featured Opportunities"
- **Link**: "View All Resources" → /resources

**FR-HOME-4: How It Works**
- **Section**: 3-step process explanation
  - Step 1: Select income bracket
  - Step 2: Choose your goal
  - Step 3: Get matched resources
- **Visual**: Numbered steps with icons

#### Technical Specifications
- **Page**: `src/pages/index.astro`
- **Components**: `Hero.astro`, `Header.astro`, `Footer.astro`
- **Data**: Fetch featured resources via `getCollection()`

#### Acceptance Criteria
- [ ] Hero is visually engaging and clear
- [ ] CTAs are prominent and functional
- [ ] Stats update automatically from data
- [ ] Featured resources pull from database
- [ ] Mobile layout stacks appropriately

---

### 3.6 Feature: About Page

#### Description
Informational page explaining the project, income brackets, and how to contribute.

#### Functional Requirements

**FR-ABT-1: Mission Statement**
- Explain project purpose and social impact goals

**FR-ABT-2: Income Bracket Guide**
- Detailed explanation of B40/M40/T20 with income ranges
- Visual distinction with colored borders

**FR-ABT-3: Contribution Guide**
- How to add resources via GitHub
- Link to repository
- Contribution guidelines

**FR-ABT-4: Tech Stack**
- List of technologies used
- Credit to GitHub Copilot and Krackathon

**FR-ABT-5: Disclaimer**
- Not affiliated with government
- Verify information with providers
- Educational purposes only

#### Technical Specifications
- **Page**: `src/pages/about.astro`
- **Style**: Long-form content with section breaks
- **Links**: External links to GitHub and resources

#### Acceptance Criteria
- [ ] All sections present and readable
- [ ] Income brackets clearly explained
- [ ] GitHub link functional
- [ ] Disclaimer is prominent

---

## 4. Technical Architecture

### 4.1 Technology Stack

| Layer | Technology | Version | Purpose |
|-------|-----------|---------|---------|
| Framework | Astro | 5.x | Static site generation, routing |
| UI Library | React | 18.x | Interactive components |
| Styling | Tailwind CSS | 4.x | Utility-first styling |
| Components | shadcn/ui | Latest | Pre-built accessible components |
| Language | TypeScript | 5.x | Type safety |
| Validation | Zod | Latest | Schema validation |
| Deployment | Netlify | N/A | CDN hosting |
| Version Control | Git/GitHub | N/A | Source control |

### 4.2 Architecture Pattern: Islands

**Concept**: Astro's Islands Architecture
- **Static by default**: `.astro` files render to HTML at build time
- **Selective hydration**: `.tsx` React components hydrate only when needed
- **Hydration strategies**:
  - `client:load` - Hydrate immediately on page load
  - `client:visible` - Hydrate when component enters viewport
  - `client:idle` - Hydrate when browser is idle

**Implementation in EduLaluan**:
- Static: Header, Footer, Hero, Layout → `.astro` files
- Interactive: Navigator, FilterBar, ResourceCard → `.tsx` files
- Result: Fast initial load, interactive where needed

### 4.3 Data Architecture

```
Content Collections (Zod-validated)
    ↓
Build Time (Astro)
    ↓
Static JSON bundled with site
    ↓
Runtime (Pages fetch via getCollection())
    ↓
Props passed to React islands
    ↓
Client-side filtering/display
```

**Benefits**:
- Type-safe content at build time
- No runtime database needed
- Fast content access (no API calls)
- Easy contributions (JSON files)

### 4.4 File Structure

```
src/
├── components/
│   ├── ui/                    # shadcn/ui components (React)
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── input.tsx
│   │   ├── select.tsx
│   │   └── badge.tsx
│   ├── Header.astro           # Site header (static)
│   ├── Footer.astro           # Site footer (static)
│   ├── Hero.astro             # Homepage hero (static)
│   ├── Navigator.tsx          # Smart navigator (React island)
│   ├── FilterBar.tsx          # Filter interface (React island)
│   ├── ResourceCard.tsx       # Resource display (React)
│   └── ResourcesPage.tsx      # Resources page wrapper (React)
├── content/
│   ├── config.ts              # Zod schemas
│   └── resources/             # JSON resource files (40+)
├── layouts/
│   └── Layout.astro           # Base HTML wrapper
├── lib/
│   └── utils.ts               # cn() utility for class merging
├── pages/                     # File-based routing
│   ├── index.astro            # Homepage
│   ├── navigate.astro         # Navigator page
│   ├── resources.astro        # All resources page
│   └── about.astro            # About page
└── styles/
    └── global.css             # Global styles + Tailwind imports
```

### 4.5 Component Communication

**Pattern**: Props down, no state management library needed

```
Astro Page (Server)
    ↓ (fetch data via getCollection())
    ↓ (pass as props)
React Island (Client)
    ↓ (local state via useState)
Child Components
```

**Example**: Resources page
1. `resources.astro` fetches all resources
2. Passes to `<ResourcesPage client:load resources={resources} />`
3. `ResourcesPage.tsx` manages filter state
4. Passes filtered results to `ResourceCard.tsx` components

### 4.6 Build and Deployment

**Build Process**:
```bash
npm run build
    ↓
1. TypeScript compilation
2. Astro content validation (Zod)
3. Static HTML generation
4. React component bundling
5. CSS optimization (Tailwind purge)
6. Asset optimization
    ↓
dist/ (static files ready for deployment)
```

**Deployment**:
- **Host**: Netlify
- **Trigger**: Git push to main branch
- **Build Command**: `npm run build`
- **Publish Directory**: `dist/`
- **Environment**: Node.js 18+

### 4.7 Performance Optimizations

1. **Static Generation**: No server-side rendering overhead
2. **Islands Architecture**: Minimal JavaScript shipped to client
3. **Tailwind Purge**: Unused CSS removed at build time
4. **CDN Delivery**: Netlify's global CDN for fast access
5. **Image Optimization**: Future enhancement (not in MVP)
6. **Code Splitting**: Automatic per-page by Astro

---

## 5. Design System

### 5.1 Color Palette

**Primary Colors**:
- Teal: `#0d9488` (malaysia-teal) - Education, growth, trust
- Gold: `#d97706` (malaysia-gold) - Malaysian warmth, achievement

**Neutral Colors** (from Tailwind):
- Slate 50-900 for backgrounds and text
- Gray for borders and muted content

**Semantic Colors**:
- Success: Green (free resources)
- Warning: Amber (subsidized)
- Info: Blue (paid)
- Danger: Red (errors, if needed)

### 5.2 Typography

**Font Family**: Inter (imported from Google Fonts)
- Modern, readable, supports Malay characters
- Fallback: system-ui, sans-serif

**Type Scale**:
- H1: 36px (mobile) / 48px (desktop), bold
- H2: 30px / 36px, semibold
- H3: 24px / 30px, semibold
- Body: 16px, regular
- Small: 14px, regular

### 5.3 Spacing

**Base Unit**: 4px (Tailwind default)
- Component padding: 16px (4 units)
- Card padding: 20px (5 units)
- Section margins: 48px (12 units)
- Grid gaps: 16-24px

### 5.4 Components

**Buttons**:
- Primary: Teal background, white text, rounded
- Secondary: White background, teal border and text
- Ghost: Transparent, gray text, underline on hover

**Cards**:
- White background, subtle border
- Rounded corners (8px)
- Hover: shadow increase, border color change

**Badges**:
- Small, rounded pills
- Variant colors based on content type
- Uppercase text, small font size

### 5.5 Responsive Breakpoints

- Mobile: < 640px (sm)
- Tablet: 640px - 1024px (md, lg)
- Desktop: > 1024px (xl)

**Design Philosophy**: Mobile-first

---

## 6. User Experience

### 6.1 User Flows

**Flow 1: Quick Navigation (Primary)**
```
Homepage → Click "Start Navigator" →
Step 1: Select Income Group →
Step 2: Select Goal →
Step 3: View Results →
Click Resource "Learn More" →
External Resource Site (new tab)
```

**Flow 2: Browsing (Secondary)**
```
Homepage → Click "Browse Resources" →
Resources Page → Apply Filters →
View Filtered Results →
Click Resource → External Site
```

**Flow 3: Learning About Project**
```
Any Page → Click "About" in Header →
About Page → Read Mission/Brackets →
Click GitHub Link → Repository
```

### 6.2 Error States

**No Results Found**:
- Message: "No resources found for your selection"
- Action: "Try adjusting your filters" or "Start Over"
- Design: Centered card with icon

**External Link Failure**:
- Handled by browser (link opens in new tab)
- User can return to EduLaluan

**Build-Time Errors** (Content Validation):
- Caught during `npm run build`
- Prevents deployment of invalid data

### 6.3 Accessibility

**WCAG 2.1 Level AA Compliance**:
- [ ] Semantic HTML (h1-h6 hierarchy)
- [ ] ARIA labels for interactive elements
- [ ] Keyboard navigation (Tab, Enter, Esc)
- [ ] Focus indicators visible
- [ ] Color contrast ratios > 4.5:1
- [ ] Alt text for images (if added)
- [ ] Screen reader tested

**Keyboard Shortcuts**:
- Tab: Navigate through interactive elements
- Enter/Space: Activate buttons and links
- Esc: Close modals (if added)

### 6.4 Performance

**Targets**:
- **First Contentful Paint (FCP)**: < 1.5s
- **Largest Contentful Paint (LCP)**: < 2.5s
- **Time to Interactive (TTI)**: < 3.5s
- **Cumulative Layout Shift (CLS)**: < 0.1
- **Lighthouse Score**: > 90 across all categories

**Monitoring**: Netlify Analytics (optional), Lighthouse CI

---

## 7. Content Strategy

### 7.1 Resource Curation Guidelines

**Selection Criteria**:
1. **Legitimacy**: Official organizations, reputable providers
2. **Accessibility**: Clear eligibility, application process
3. **Impact**: High value for target users
4. **Availability**: Currently active and accepting applications/enrollments
5. **Diversity**: Coverage across all income groups and categories

**Sources**:
- Malaysian government websites (PTPTN, MARA, JPA)
- Established MOOCs (Coursera, edX, MIT OCW)
- Reputable NGOs (Khazanah, Petronas foundations)
- Free coding platforms (freeCodeCamp, The Odin Project)
- Malaysian TVET institutions

### 7.2 Content Maintenance

**Update Frequency**:
- Quarterly review of all resources
- Immediate updates for broken links or major changes
- Community contributions reviewed within 1 week

**Deprecation Process**:
1. Mark resource as outdated (add tag)
2. Research replacement or update
3. Remove if no longer valid

### 7.3 Multi-Language Strategy (Future)

**Phase 1 (MVP)**: English descriptions, Malay resource support
**Phase 2**: Full Bahasa Malaysia interface
**Phase 3**: Chinese and Tamil support (if demand exists)

---

## 8. Testing Strategy

### 8.1 Testing Types

**Functional Testing**:
- [ ] Navigator: All steps work, results filter correctly
- [ ] Filters: Each filter works independently and combined
- [ ] Links: All resource links valid and open correctly
- [ ] Navigation: Header/footer links work on all pages

**Cross-Browser Testing**:
- [ ] Chrome (latest)
- [ ] Safari (latest)
- [ ] Firefox (latest)
- [ ] Edge (latest)
- [ ] Mobile Safari (iOS)
- [ ] Mobile Chrome (Android)

**Responsive Testing**:
- [ ] 360px (small mobile)
- [ ] 375px (iPhone SE)
- [ ] 414px (iPhone Pro Max)
- [ ] 768px (iPad)
- [ ] 1024px (desktop)
- [ ] 1920px (large desktop)

**Accessibility Testing**:
- [ ] NVDA screen reader (Windows)
- [ ] VoiceOver (Mac/iOS)
- [ ] Keyboard-only navigation
- [ ] WAVE accessibility checker
- [ ] axe DevTools

**Performance Testing**:
- [ ] Lighthouse audits (all pages)
- [ ] WebPageTest (3G/4G networks)
- [ ] Real device testing (low-end Android)

### 8.2 Test Cases

**TC-01: Complete Navigator Flow**
1. Go to /navigate
2. Select "B40"
3. Select "Scholarships"
4. Verify results show only B40 scholarships
5. Click "Back", change to "M40"
6. Verify results update
7. Click "Start Over"
8. Verify reset to step 1

**TC-02: Advanced Filtering**
1. Go to /resources
2. Type "free" in search
3. Select category "Digital Skills"
4. Select income "B40"
5. Verify all filters applied (badge display)
6. Click "Clear All"
7. Verify all resources shown

**TC-03: External Link Security**
1. Click any "Learn More" button
2. Verify new tab opens
3. Verify rel="noopener noreferrer" in HTML
4. Verify original tab remains on EduLaluan

---

## 9. Launch and Rollout

### 9.1 Pre-Launch Checklist

**Technical**:
- [ ] All features functional
- [ ] 40+ resources added and validated
- [ ] Lighthouse score > 90
- [ ] Mobile responsive on all pages
- [ ] All links tested and working
- [ ] GitHub repository public

**Content**:
- [ ] All resources verified current
- [ ] About page complete
- [ ] README.md comprehensive
- [ ] License file present (Apache 2.0)

**Legal**:
- [ ] Disclaimer present on About page
- [ ] No copyrighted content used inappropriately
- [ ] Privacy approach clear (no data collection)

### 9.2 Launch Plan

**Soft Launch**:
- Deploy to Netlify subdomain
- Share with small group for feedback
- Fix critical issues

**Public Launch**:
- Deploy to production domain (if applicable)
- Submit to Krackathon
- Post on GitHub
- Share on social media (optional)

### 9.3 Post-Launch

**Monitoring** (Week 1):
- Check for broken links
- Monitor Netlify build status
- Review any GitHub issues

**Iteration** (Month 1):
- Collect user feedback
- Prioritize feature requests
- Add more resources based on demand

---

## 10. Future Enhancements

### 10.1 Planned Features (v2.0)

**High Priority**:
1. **Application Deadlines**: Track and alert upcoming deadlines
2. **Resource Favorites**: Let users bookmark resources (localStorage)
3. **Multi-Language UI**: Full Bahasa Malaysia translation
4. **Advanced Search**: Fuzzy matching, synonym support

**Medium Priority**:
5. **User Accounts**: Save preferences, track applications
6. **Resource Ratings**: Community reviews and ratings
7. **Email Notifications**: Alert users to new resources
8. **Admin Dashboard**: UI for non-technical resource management

**Low Priority**:
9. **AI Recommendations**: ML-based resource matching
10. **Mobile App**: Progressive Web App (PWA) or native
11. **API**: Expose resources for third-party integrations
12. **Analytics Dashboard**: Public impact metrics

### 10.2 Technical Debt

**Current Limitations**:
- No backend (limits advanced features)
- Manual resource curation (time-intensive)
- No automated link checking
- Basic filtering (no AI/ML)

**Refactoring Needs**:
- Extract filter logic to shared utilities
- Create resource card component variants
- Implement proper testing suite
- Add E2E tests with Playwright

---

## 11. Appendices

### 11.1 API Specifications (Future)

If backend is added, REST API structure:

```
GET /api/resources
GET /api/resources/:id
POST /api/resources (admin only)
PUT /api/resources/:id (admin only)
DELETE /api/resources/:id (admin only)
GET /api/resources/search?q=...&category=...
```

### 11.2 Database Schema (Future)

If database is added:

```sql
CREATE TABLE resources (
  id UUID PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  provider VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  url VARCHAR(500) NOT NULL,
  category VARCHAR(50) NOT NULL,
  income_groups VARCHAR[] NOT NULL,
  cost VARCHAR(20) NOT NULL,
  mode VARCHAR(20) NOT NULL,
  languages VARCHAR[] NOT NULL,
  tags VARCHAR[] NOT NULL,
  featured BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

### 11.3 Glossary

- **Islands Architecture**: Astro pattern for partial hydration
- **Content Collections**: Astro's type-safe content management
- **Static Site Generation (SSG)**: Pre-rendering pages at build time
- **Zod**: TypeScript schema validation library
- **shadcn/ui**: Copy-paste component library built on Radix UI
- **Tailwind**: Utility-first CSS framework
- **B40/M40/T20**: Malaysian income bracket classifications

---

## Document Approval

| Role | Name | Date | Status |
|------|------|------|--------|
| Product Owner | EduLaluan Team | Feb 2026 | ✅ Approved |
| Engineering Lead | EduLaluan Team | Feb 2026 | ✅ Approved |
| Design Lead | N/A | Feb 2026 | N/A |
| QA Lead | N/A | Feb 2026 | N/A |

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | Feb 2026 | EduLaluan Team | Initial PRD for v1.0 launch |
| 1.1 | Feb 14, 2026 | EduLaluan Team | Added elite-institutions category: 15 boarding schools + 13 universities (28 resources). Updated personas for multicultural inclusivity. |

---

**End of Product Requirements Document**
