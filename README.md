# 🎓 EduLaluan

> A smart education resource navigator for Malaysian B40, M40 & T20 communities

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Built with Astro](https://astro.badg.es/v2/built-with-astro/tiny.svg)](https://astro.build)

**EduLaluan** (Education Path) helps Malaysian families discover scholarships, free courses, vocational training, and financial aid programs tailored to their income bracket and educational goals.

🏆 **Built for Krackathon** - Category: Best Practical Use

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
│   │   └── about.astro        # About page
│   └── styles/
│       └── global.css         # Global styles + Tailwind
├── astro.config.mjs     # Astro configuration
├── tailwind.config.mjs  # Tailwind configuration
├── tsconfig.json        # TypeScript configuration
└── package.json
```

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

- Built for **Krackathon** hackathon
- Developed with assistance from **GitHub Copilot**
- Inspired by the need to democratize access to education in Malaysia
- Community resources curated from government agencies, NGOs, and educational platforms

## 📧 Contact

- GitHub: [@pizofreude](https://github.com/pizofreude)
- Repository: [pizofreude/edulaluan](https://github.com/pizofreude/edulaluan)

## ⚠️ Disclaimer

EduLaluan is an independent community project not officially affiliated with any government agency or organization. Information is provided for educational purposes. Always verify details with official sources before applying.

---

**Built with ❤️ for Malaysian communities** 🇲🇾
