# 🎓 EduLaluan

> A smart education resource navigator for Malaysian B40, M40 & T20 communities

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Built with Astro](https://astro.badg.es/v2/built-with-astro/tiny.svg)](https://astro.build)

**EduLaluan** (Education Path) helps Malaysian families discover scholarships, free courses, vocational training, and financial aid programs tailored to their income bracket and educational goals.

🏆 **Built for Krackathon & GodamSahur** - Category: Best Practical Use

## 🌙 About GodamSahur

EduLaluan was built for [**GodamSahur**](https://sahur.dev/) - a virtual hackathon running throughout Ramadan 1447H organized by [Amanz Media](https://amanz.my).

**GodamSahur** combines "Godam" (forge/hammer) + "Sahur" (pre-dawn meal), encouraging participants to spend **one hour daily after sahur** building ideas or projects they've wanted to create. The mission is to:

- Encourage developers to build projects during Ramadan with manageable daily commitment (1 hour/day)
- Foster creation of projects that **help the community**
- Promote building in public and sharing progress with others

Projects span categories like:
- **Kewangan** - Muslim-friendly personal finance tools
- **Mini SaaS** - Simple platforms solving community problems
- **Sosial** - Social impact projects
- **API Integration** - Building on existing platforms

💰 **RM10,000 in prizes** sponsored by Amanz, split among all MVP completers.

## ✨ Features

- **🎯 Smart Navigator**: Answer simple questions to get personalized resource recommendations
- **🔍 Advanced Filtering**: Search and filter by category, income group, cost, and education level
- **📚 Comprehensive Database**: 146+ curated educational resources including:
  - 77 Malaysian government boarding schools (SBP/Sekolah Berasrama Penuh)
  - Government scholarships (PTPTN, PTPK, MARA, JPA, Khazanah, Petronas)
  - Free online courses (edX, Coursera, MIT OCW, CS50, Code.org)
  - Digital skills training (freeCodeCamp, 42 Penang, KrackedDevs)
  - Financial aid programs
  - TVET and vocational training
  - Elite boarding schools (Eton, Le Rosey, Phillips Exeter, MCKK)
  - Top universities (Oxford, Stanford, ETH Zurich)
- **🎓 Education Level Filtering**: Resources tagged by Malaysian education system (Primary, Secondary, Post-Secondary, Tertiary)
- **💰 Income-Specific**: Resources tagged for B40, M40, and T20 households
- **🌐 Multi-Language**: Support for English and Bahasa Malaysia content
- **📱 Mobile-First**: Fully responsive design for all devices
- **⚡ Lightning Fast**: Static-first architecture with React islands
- **🏆 Leaderboard**: GasBuddy-style public leaderboard with time period filters (All-Time, 30-Day, Half-Year)
- **👥 Community Features**:
  - User authentication via GitHub OAuth
  - Role-based access control (Super Admin, Admin, Moderator, User)
  - Contribution tracking and points system
  - Community dashboard
- **🛡️ Admin System**:
  - Admin management dashboard
  - Invite-based admin/moderator system
  - Content moderation queue
  - Super admin protection

## 🛠️ Tech Stack

- **Framework**: [Astro 5.x](https://astro.build) - Static-first, islands architecture
- **UI Library**: [React 18](https://react.dev) - Interactive components as Astro islands
- **Styling**: [Tailwind CSS 4](https://tailwindcss.com) - Utility-first CSS
- **Components**: [shadcn/ui](https://ui.shadcn.com) - Beautiful, accessible components
- **Data**: Astro Content Collections with JSON files
- **Deployment**: [Netlify](https://netlify.com) - Free static hosting
- **Language**: TypeScript - Type-safe development

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ and npm

### Installation

1. Clone the repository:
```bash
git clone https://github.com/pizofreude/edulaluan.git
cd edulaluan
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

4. Open your browser to `http://localhost:4321`

### Build for Production

```bash
npm run build
```

The built site will be in the `dist/` directory.

### Preview Production Build

```bash
npm run preview
```

## 📁 Project Structure

```
edulaluan/
├── public/              # Static assets
│   └── favicon.svg
├── src/
│   ├── components/      # Astro & React components
│   │   ├── ui/         # shadcn/ui components
│   │   ├── Header.astro
│   │   ├── Footer.astro
│   │   ├── Hero.astro
│   │   ├── Navigator.tsx      # Multi-step wizard
│   │   ├── ResourceCard.tsx   # Resource display
│   │   └── FilterBar.tsx      # Filtering interface
│   ├── content/
│   │   ├── config.ts          # Content collection schema
│   │   └── resources/         # 40+ JSON resource files
│   ├── layouts/
│   │   └── Layout.astro       # Base HTML layout
│   ├── lib/
│   │   └── utils.ts           # Utility functions
│   ├── pages/
│   │   ├── index.astro        # Landing page
│   │   ├── navigate.astro     # Navigator page
│   │   ├── resources.astro    # All resources
│   │   ├── leaderboard.astro  # Public leaderboard ⭐
│   │   ├── dashboard.astro    # User dashboard ⭐
│   │   ├── contribute.astro   # Contribution form ⭐
│   │   ├── auth/
│   │   │   ├── login.astro    # Login page ⭐
│   │   │   └── callback.astro # OAuth callback ⭐
│   │   └── admin/
│   │       ├── dashboard.astro    # Admin dashboard ⭐
│   │       ├── moderation.astro   # Moderation queue ⭐
│   │       └── manage.astro       # Admin management ⭐
│   └── styles/
│       └── global.css         # Global styles + Tailwind
├── docs/                  # Project documentation
│   ├── ADMIN_ARCHITECTURE.md
│   ├── BRD.md
│   ├── PRD.md
│   ├── PROJECT_STATE.md
│   └── peoples-guide/     # Rakyat's Guide content
├── astro.config.mjs     # Astro configuration
├── tailwind.config.mjs  # Tailwind configuration
├── tsconfig.json        # TypeScript configuration
└── package.json
```

## 📖 Documentation

Detailed documentation is available in the `docs/` folder:

- **[ADMIN_ARCHITECTURE.md](docs/ADMIN_ARCHITECTURE.md)** - Admin system design, roles, permissions, and API endpoints
- **[BRD.md](docs/BRD.md)** - Business Requirements Document
- **[PRD.md](docs/PRD.md)** - Product Requirements Document
- **[PROJECT_STATE.md](docs/PROJECT_STATE.md)** - Current session state and accomplishments
- **[peoples-guide/](docs/peoples-guide/)** - Rakyat's Guide content (10 sections)
- **[privacy-policy.md](docs/privacy-policy.md)** - Privacy policy
- **[terms-of-service.md](docs/terms-of-service.md)** - Terms of service

## 📝 Adding New Resources

Resources are stored as JSON files in `src/content/resources/`. To add a new resource:

1. Create a new `.json` file in `src/content/resources/`
2. Follow the schema:

```json
{
  "name": "Resource Name",
  "provider": "Provider Organization",
  "description": "Brief description of the resource",
  "url": "https://example.com",
  "category": "scholarship",
  "incomeGroups": ["B40", "M40"],
  "cost": "free",
  "mode": "online",
  "language": ["en", "ms"],
  "tags": ["tag1", "tag2"],
  "featured": false,
  "educationLevel": ["secondary", "tertiary"]
}
```

**Categories**: `scholarship`, `mooc`, `tvet`, `financial-aid`, `digital-skills`, `degree`, `secondary-education`, `elite-institutions`, `community`, `other`

**Income Groups**: `B40` (< RM4,850), `M40` (RM4,850-10,970), `T20` (> RM10,970)

**Cost**: `free`, `subsidized`, `paid`

**Mode**: `online`, `in-person`, `hybrid`

**Languages**: `en`, `ms`, `zh`, `ta`

**Education Levels** (optional): `primary` (Std 1-6), `secondary` (Form 1-5/SPM), `post-secondary` (STPM/Diploma), `tertiary` (Degree+), `all-levels`

3. The resource will automatically appear on the site after rebuilding

## 🎨 Design System

- **Primary Color**: Teal (#0d9488) - Represents growth and education
- **Accent Color**: Amber/Gold (#d97706) - Malaysian-inspired warmth
- **Typography**: Inter font family
- **Components**: Built with shadcn/ui for consistency and accessibility

## 🌍 Income Bracket Guide

- **B40 (Bottom 40%)**: Household income < RM4,850/month
- **M40 (Middle 40%)**: Household income RM4,850 - RM10,970/month
- **T20 (Top 20%)**: Household income > RM10,970/month

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Add Resources**: Submit new educational resources via pull request
2. **Improve UI/UX**: Enhance the design or user experience
3. **Fix Bugs**: Report or fix issues
4. **Translate**: Help translate content to reach more Malaysians
5. **Share**: Spread the word about EduLaluan

### Development Workflow

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test locally: `npm run dev`
5. Commit: `git commit -m 'Add amazing feature'`
6. Push: `git push origin feature/amazing-feature`
7. Open a Pull Request

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built for **Krackathon** & **GodamSahur** hackathons
- Organized by [**Amanz Media**](https://amanz.my) - Malaysian tech media company
- Developed with assistance from **GitHub Copilot**
- Inspired by the need to democratize access to education in Malaysia
- Community resources curated from government agencies, NGOs, and educational platforms

## 🚀 Latest Session (March 22, 2026)

**Status**: ✅ All features complete, zero TypeScript errors

### Key Accomplishments:
1. ✅ Fixed GitHub OAuth login - Created auth callback page, fixed user creation trigger
2. ✅ Implemented complete role system - super_admin, admin, moderator, user
3. ✅ Added Super Admin protection triggers - Cannot delete/demote super admins
4. ✅ Created Admin Management page at `/admin/manage` with stats, invite form, and admins table
5. ✅ Built API endpoints for admin invite, role removal, and user listing
6. ✅ Fixed navbar - Added Community dropdown with Contribute, Leaderboard, Dashboard links
7. ✅ Created GasBuddy-style public leaderboard at `/leaderboard` with time period filters
8. ✅ Fixed all TypeScript errors
9. ✅ Moved documentation to `docs/` folder

**Super Admin**: ahafeezs@outlook.de

---

## 📧 Contact

- GitHub: [@pizofreude](https://github.com/pizofreude)
- Form: [EduLaluan Forms](https://edulaluan.netlify.app/contribute/)

## ⚠️ Disclaimer

EduLaluan is an independent community project not officially affiliated with any government agency or organization. Information is provided for educational purposes. Always verify details with official sources before applying.

---

**Built with 💚 for Malaysian communities** 🇲🇾
