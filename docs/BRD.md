# Business Requirements Document (BRD)
## EduLaluan - Smart Education Resource Navigator

---

### Document Information
- **Project Name**: EduLaluan
- **Version**: 1.0
- **Date**: February 2026
- **Status**: Completed (Krackathon Hackathon)
- **Document Owner**: EduLaluan Team

---

## 1. Executive Summary

### 1.1 Purpose
EduLaluan (Education Path) is a web-based platform designed to democratize access to educational opportunities in Malaysia by connecting families across B40, M40, and T20 income brackets with relevant scholarships, free courses, vocational training, and financial aid programs.

### 1.2 Business Objectives
- **Primary**: Reduce information barriers preventing Malaysians from accessing educational opportunities
- **Secondary**: Build a comprehensive, curated database of 40+ Malaysian education resources
- **Tertiary**: Demonstrate practical technology solutions for social impact at Krackathon

### 1.3 Target Audience
- **Primary Users**: Malaysian families and students seeking educational opportunities
- **Demographics**: All income groups (B40, M40, T20), ages 15-40
- **Geographic**: Malaysia-wide, with focus on underserved communities
- **Language**: English and Bahasa Malaysia speakers

---

## 2. Business Problem

### 2.1 Problem Statement
Malaysian families, particularly in B40 and M40 income groups, face significant challenges in discovering and accessing educational opportunities due to:

1. **Information Fragmentation**: Resources scattered across multiple government agencies, NGOs, and private organizations
2. **Awareness Gap**: Low-income families unaware of available subsidies and free programs
3. **Navigation Complexity**: Difficult to determine eligibility and relevance of programs
4. **Language Barriers**: Many resources available only in English or only in Malay
5. **Technology Access**: Traditional information channels don't reach digitally-connected youth effectively

### 2.2 Current Situation
- Educational resources exist but discovery is manual and time-consuming
- No centralized platform tailored to Malaysian income-based education ecosystem
- Families often miss application deadlines due to lack of awareness
- Significant human potential remains untapped due to information asymmetry

### 2.3 Business Impact
**Without Solution:**
- Continued educational inequality between income groups
- Underutilization of government and NGO educational programs
- Lost economic productivity from unrealized human potential

**With Solution:**
- Increased enrollment in educational programs across all income groups
- Better utilization of existing government and NGO resources
- Measurable social impact through education access metrics

---

## 3. Business Requirements

### 3.1 Functional Requirements

#### FR-1: Smart Navigator
- **Requirement**: Multi-step wizard to guide users to relevant resources
- **Business Value**: Reduce decision paralysis and improve resource matching accuracy
- **Inputs**: Income group, educational goals
- **Outputs**: Personalized list of 5-20 relevant resources
- **Priority**: Critical

#### FR-2: Resource Database
- **Requirement**: Comprehensive database of 40+ educational resources
- **Business Value**: Central source of truth for Malaysian education opportunities
- **Categories Required**:
  - Scholarships (government, corporate, NGO)
  - MOOCs (Massive Open Online Courses)
  - TVET (Technical and Vocational Education and Training)
  - Financial Aid
  - Digital Skills Training
  - Degree Programs
  - Community Programs
- **Priority**: Critical

#### FR-3: Advanced Filtering
- **Requirement**: Multi-criteria search and filter interface
- **Business Value**: Allow power users to quickly find specific resource types
- **Filters Required**:
  - Search by keyword
  - Category selection
  - Income group (B40/M40/T20)
  - Cost (free/subsidized/paid)
  - Mode (online/in-person/hybrid)
- **Priority**: High

#### FR-4: Resource Display
- **Requirement**: Clear, accessible presentation of resource information
- **Business Value**: Enable quick evaluation of resource relevance
- **Information Displayed**:
  - Resource name and provider
  - Description (150-300 words)
  - Direct link to resource
  - Income group eligibility
  - Cost structure
  - Delivery mode
  - Language availability
  - Tags for additional filtering
- **Priority**: Critical

#### FR-5: Mobile Responsiveness
- **Requirement**: Full functionality on mobile devices
- **Business Value**: Reach users where they are (mobile-first in Malaysia)
- **Target**: 100% feature parity on screens 360px and above
- **Priority**: High

### 3.2 Non-Functional Requirements

#### NFR-1: Performance
- **Requirement**: Page load time < 2 seconds on 4G networks
- **Business Value**: Reduce bounce rate, improve user experience
- **Metrics**: Lighthouse score > 90
- **Priority**: High

#### NFR-2: Accessibility
- **Requirement**: WCAG 2.1 Level AA compliance
- **Business Value**: Ensure platform usable by users with disabilities
- **Implementation**: Semantic HTML, ARIA labels, keyboard navigation
- **Priority**: Medium

#### NFR-3: Scalability
- **Requirement**: Support database growth to 200+ resources without performance degradation
- **Business Value**: Enable long-term platform growth
- **Implementation**: Static site generation, efficient build process
- **Priority**: Medium

#### NFR-4: Maintainability
- **Requirement**: Easy addition of new resources without code changes
- **Business Value**: Enable community contributions, reduce maintenance burden
- **Implementation**: JSON-based content, schema validation
- **Priority**: High

#### NFR-5: Availability
- **Requirement**: 99.5% uptime
- **Business Value**: Ensure resource is always accessible when needed
- **Implementation**: Netlify CDN, static hosting
- **Priority**: Medium

---

## 4. Stakeholders

### 4.1 Primary Stakeholders
- **End Users**: Malaysian families and students seeking education
- **Project Team**: Developers, designers building the platform
- **Krackathon Judges**: Evaluating social impact and technical execution

### 4.2 Secondary Stakeholders
- **Resource Providers**: Government agencies, NGOs, educational platforms
- **Community Contributors**: Open-source contributors adding resources
- **Education Advocates**: Organizations promoting educational access in Malaysia

---

## 5. Success Criteria

### 5.1 Project Success Metrics
- **Functional Completeness**: All critical features (FR-1, FR-2, FR-4) implemented and working
- **Resource Coverage**: Minimum 40 curated resources across 6+ categories
- **User Experience**: Intuitive navigation with ≤3 clicks to reach any resource
- **Technical Quality**: Functional deployment with < 2s load time

### 5.2 Business Success Metrics (Future)
- **User Adoption**: 1,000+ monthly active users within 6 months
- **Resource Discovery**: Average 5 resources viewed per session
- **Engagement**: 60%+ users complete smart navigator flow
- **Impact**: 100+ users report applying to discovered programs

### 5.3 Social Impact Metrics (Future)
- **Awareness**: Increase in awareness of B40-targeted programs
- **Applications**: Measurable increase in applications to featured resources
- **Community**: Active GitHub contributors adding new resources

---

## 6. Assumptions and Constraints

### 6.1 Assumptions
1. Target users have internet access (via mobile or computer)
2. Resource provider websites remain accessible and stable
3. Income bracket definitions (B40/M40/T20) remain consistent with Malaysian standards
4. Users are comfortable with basic web navigation
5. Resource information remains relatively stable (low update frequency)

### 6.2 Constraints
- **Time**: Hackathon timeline (limited development period)
- **Budget**: Zero budget (open-source technologies only)
- **Data**: Manual curation (no automated resource discovery)
- **Team**: Solo developer with Copilot assistance
- **Scope**: Read-only platform (no user accounts, applications, or backend)

### 6.3 Dependencies
- **External Resources**: Availability and accuracy of resource provider websites
- **Hosting**: Netlify free tier availability and performance
- **Technology**: Astro, React, and Tailwind CSS ecosystem stability

---

## 7. Risks and Mitigation

### 7.1 Business Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Resource information becomes outdated | High | High | Include "verify with provider" disclaimer; community update process |
| Low user adoption | Medium | Medium | Social media promotion; partnership with education advocates |
| Scope creep during development | Medium | Medium | Strict adherence to MVP feature set; document future features |
| Similar platform launches | Low | Low | Emphasize Malaysian focus and income-specific filtering |

### 7.2 Technical Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Performance issues with many resources | Medium | Low | Static site generation; efficient filtering algorithms |
| Mobile compatibility issues | High | Low | Mobile-first development; extensive device testing |
| Netlify deployment limitations | Medium | Low | Fallback hosting options (GitHub Pages, Vercel) |
| Content schema changes | Low | Low | Zod schema validation; migration scripts |

---

## 8. Scope

### 8.1 In Scope
- Smart navigator with 3-step wizard
- Resource database with 40+ manually curated entries
- Advanced filtering interface
- Mobile-responsive design
- Static website deployment
- Open-source codebase on GitHub

### 8.2 Out of Scope (Future Enhancements)
- User authentication and accounts
- Application tracking and deadlines
- Resource provider integration/APIs
- Multi-language interface (only English for MVP)
- Email notifications for new resources
- Admin dashboard for resource management
- User reviews and ratings
- Resource recommendation algorithm (ML/AI)
- Analytics and usage tracking (beyond basic)

---

## 9. Timeline and Milestones

### 9.1 Project Phases
1. **Planning & Design**: Requirements gathering, architecture design
2. **Development**: Core features implementation
3. **Content Population**: Resource database curation (40+ entries)
4. **Testing & Polish**: Bug fixes, UX refinement
5. **Deployment**: Netlify production deployment
6. **Submission**: Krackathon hackathon submission

### 9.2 Key Milestones
- ✅ Project architecture defined
- ✅ Smart Navigator implemented and functional
- ✅ 40+ resources curated and validated
- ✅ Mobile responsiveness achieved
- ✅ Production deployment on Netlify
- ✅ GitHub repository published
- ✅ Krackathon submission completed

---

## 10. Budget and Resources

### 10.1 Budget
- **Total Budget**: $0
- **Hosting**: Netlify Free Tier
- **Domain**: Not required (Netlify subdomain)
- **Development Tools**: Free and open-source

### 10.2 Resources
- **Human Resources**: 1 developer with GitHub Copilot
- **Technology Stack**: 
  - Astro 5.x (framework)
  - React 18 (UI library)
  - Tailwind CSS 4 (styling)
  - TypeScript (language)
  - shadcn/ui (component library)
- **Infrastructure**: Netlify CDN (free tier)

---

## 11. Compliance and Legal

### 11.1 Licensing
- **Project License**: Apache 2.0 (open-source)
- **Allows**: Commercial use, modification, distribution, patent use
- **Requires**: License and copyright notice, state changes

### 11.2 Data Privacy
- **No user data collection**: Static site with no backend
- **No cookies**: No tracking or analytics cookies
- **No personal information**: No user accounts or forms
- **External links**: Disclaimer that users leave platform when clicking resources

### 11.3 Disclaimers
- Not affiliated with government agencies or organizations
- Information provided for educational purposes only
- Users must verify details with official sources
- No guarantee of resource accuracy or availability

---

## 12. Appendices

### 12.1 Glossary
- **B40**: Bottom 40% income group (< RM4,850/month household income)
- **M40**: Middle 40% income group (RM4,850-10,970/month)
- **T20**: Top 20% income group (> RM10,970/month)
- **MOOC**: Massive Open Online Course
- **TVET**: Technical and Vocational Education and Training
- **Islands Architecture**: Astro pattern for selective client-side hydration

### 12.2 References
- Malaysian Department of Statistics Income Classifications
- Krackathon Hackathon Guidelines
- Government of Malaysia Education Initiatives
- Astro Framework Documentation
- shadcn/ui Component Library

---

## Document Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Project Owner | EduLaluan Team | - | Feb 2026 |
| Technical Lead | EduLaluan Team | - | Feb 2026 |
| Stakeholder | Krackathon | - | Feb 2026 |

---

**End of Business Requirements Document**
