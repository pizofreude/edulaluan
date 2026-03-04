# REFRAME: Parting

# 📄 OUTPUT TEMPLATE 1: Business Requirements Document (BRD)

# BRD: Parting.com

## 1. Executive Summary & Value Proposition
* **Problem Statement:** Families facing the loss of a loved one struggle to find transparent pricing and quality information about funeral homes, often making emotional decisions under time pressure without the ability to compare options or costs.
* **Core Value Proposition:** The #1 funeral home comparison website that empowers families with transparent price and quality information to make informed decisions during a difficult time, saving both time and money.
* **Business Model:** Lead generation and premium listing fees from funeral homes; funeral homes pay for enhanced visibility and priority ranking in search results, with historical data showing ~15% commission on sales made through the platform.
Based on my research, here's how Parting.com monetizes their platform:

## **Primary Monetization Model: Commission-Based Lead Generation**

**Yes, it is lead generation** — but with a specific commission structure:

### **Original Business Model (2015-2017+)**
- **15% Commission on Sales**: Funeral homes that receive customers through Parting.com pay a **15% fee** on transactions completed through the platform.
- **Free for Consumers**: Users access all pricing, reviews, and comparison tools at no cost.
- **No Traditional Advertising**: The site does not rely on display ads or pay-per-click advertising revenue.

### **How Lead Generation Works Exactly:**

1. **Consumer Searches** → User searches for funeral homes by location on Parting.com
2. **Lead Capture** → User clicks CTAs like "Call Now," "Contact Funeral Home," or "Order Now" on a funeral home's listing page
3. **Lead Delivery** → Funeral home receives the inquiry (phone call, email, or form submission)
4. **Commission Tracking** → When that lead converts to a sale, Parting.com collects **15% of the transaction value**

### **Evolution to Parting Pro (SaaS Model)**

The company has since **pivoted** from pure lead generation to a broader software platform:

- **Parting Pro** is now a **funeral home management SaaS platform** that includes online arrangement tools, payment processing, document generation, and back-office operations [[Parting Pro blog]].
- This suggests funeral homes now pay **subscription fees** for the software suite, not just commission on leads.
- Estimated annual revenue is approximately **$2.7 million** with 11-50 employees.

### **Why This Model Works:**

According to co-founder Tyler Chang in the Forbes interview: *"Their profit margins are really big. They should pay for anything that will grow their business"*. Funeral industry profit margins are substantial enough to absorb the 15% commission for qualified leads.

### **Key Distinction:**

| Revenue Stream | How It Works |
|---------------|--------------|
| **Parting.com (Consumer Site)** | 15% commission on converted leads from the free directory |
| **Parting Pro (B2B SaaS)** | Subscription fees for funeral home management software |

This two-pronged approach allows them to maintain the free consumer-facing directory (building trust and traffic) while monetizing through both lead commissions and SaaS subscriptions to funeral homes.

## 2. Target Market & User Personas
* **Persona 1: Grieving Family Member (Primary Decision Maker)** - Adults aged 35-65 who have recently lost a loved one and need to quickly arrange funeral services; they are stressed, time-constrained, and want to avoid being pressured by salespeople while ensuring they get fair pricing and quality care .
* **Persona 2: Pre-Planning Individual** - Adults aged 50+ in retirement communities or planning ahead for end-of-life arrangements; they want to research options proactively, understand costs, and make informed decisions to reduce burden on family members .

## 3. Key Performance Indicators (KPIs)
* **North Star Metric:** Funeral Home Lead Conversion Rate (users who contact a funeral home through the platform)
* **Supporting Metrics:** 
  * Search-to-Listing Page Conversion Rate
  * Premium Listing Upgrade Rate (funeral homes converting to paid tiers)
  * Monthly Active Users (MAU) returning to blog/educational content

---

# 📄 OUTPUT TEMPLATE 2: Product Requirements Document (PRD)

# PRD: Parting.com

## 1. Information Architecture & Roles
* **User Roles:** Guest (Unauthenticated User), Registered User (optional account for saving searches/preferences), Funeral Home Owner/Representative (can claim and verify listings), Admin (Parting internal team)
* **Sitemap / Navigation:** 
  * Home (Search) → Location Search Results → Funeral Home Detail Pages
  * Blog → Category Pages (Funeral FAQ's, Planning Guidance, Cost Tips, Dealing with Loss) → Individual Articles
  * About Us → Contact Form
  * FAQ → Help Content
  * Footer: Privacy Policy, Legal, Contact, Add Your Funeral Home

## 2. Epics & Feature Breakdown

### Epic 1: User Acquisition & Location-Based Search
* **Feature:** Funeral Home Search Engine
* **User Story:** As a grieving family member, I want to search for funeral homes by city or zip code so that I can quickly find local options during a time-sensitive situation.
* **Acceptance Criteria:**
  * Given a user enters a location, when they submit the search, then they see a list of funeral homes sorted by distance/relevance
  * Search accepts city, neighborhood, street, or zip code input with autocomplete suggestions
  * Results display key info: name, address, distance, starting price, rating
  * Edge case: Handle locations with no funeral homes with helpful messaging and expanded radius suggestions

### Epic 2: Funeral Home Discovery & Comparison
* **Feature:** Detailed Funeral Home Listing Pages
* **User Story:** As a cost-conscious family member, I want to see itemized pricing and services for each funeral home so that I can compare options and budget appropriately.
* **Acceptance Criteria:**
  * Given a user clicks on a funeral home, when the detail page loads, then they see: contact info, itemized price list, photos, services offered, reviews, and map location
  * Price list shows effective date with disclaimer that prices may change
  * Multiple CTAs: "Call Now," "Contact Funeral Home," "Order Now" (lead gen forms)
  * Edge case: Display "Unverified" badge for listings not claimed by funeral home owners; show message encouraging verification

### Epic 3: Funeral Home Onboarding & Premium Listings
* **Feature:** Funeral Home Listing Management
* **User Story:** As a funeral home owner, I want to claim and verify my listing so that I can update my information, add photos, and upgrade to premium status for better visibility.
* **Acceptance Criteria:**
  * Given a funeral home representative emails hello@parting.com, when verified, then they can access listing management features
  * Premium listings receive priority ranking, featured label, and panoramic profile display
  * System tracks traffic metrics to show premium members their 80%+ traffic increase benefit
  * Edge case: Handle duplicate listings; require General Price List documentation for price updates

### Epic 4: Educational Content & Trust Building
* **Feature:** Blog & Resource Center
* **User Story:** As someone unfamiliar with funeral planning, I want to access educational articles so that I can understand my options and make informed decisions without feeling overwhelmed.
* **Acceptance Criteria:**
  * Given a user visits the blog, when they browse, then they see content organized by categories (FAQ's, Planning Guidance, Cost Tips, Dealing with Loss)
  * Articles include publication dates, estimated reading time, and related content suggestions
  * Each article includes contextual CTAs to search for funeral homes
  * Edge case: Handle content updates with proper versioning and date stamps; ensure mobile-responsive design

## 3. Technical Inference & Data Model
* **Core Data Entities Required:**
  * `Funeral_Home` (Attributes: ID, Name, Address, City, State, Zip, Phone, Website, Latitude, Longitude, Verification_Status, Premium_Status, Effective_Date)
  * `Price_List_Item` (Attributes: ID, Funeral_Home_ID, Service_Name, Price, Category, Effective_Date)
  * `User_Review` (Attributes: ID, Funeral_Home_ID, Star_Rating, First_Name, Last_Name, Review_Text, Created_Date, Verified_Flag)
  * `Lead_Inquiry` (Attributes: ID, Funeral_Home_ID, User_Email, User_Phone, Message, Created_Date, Status)
  * `Blog_Article` (Attributes: ID, Title, Category, Content, Author, Publish_Date, Tags)
* **Likely Third-Party Integrations:**
  * Google Maps API - (Location search, map display, distance calculations)
  * Email Service Provider (SendGrid/Mailgun) - (Contact forms, lead notifications to funeral homes)
  * Analytics Platform (Google Analytics) - (Traffic tracking, conversion metrics for premium listings)
  * CDN/Hosting (AWS CloudFront) - (Fast content delivery for images and static assets)
  * CMS Platform (WordPress or similar) - (Blog content management)

---

**Framework Application Complete** ✅

This REFRAME analysis reveals Parting.com operates as a two-sided marketplace connecting grieving families with funeral homes through transparent pricing information. The business model relies on funeral homes paying for premium visibility while maintaining independence from the industry to preserve trust [[FAQ]]. The platform's success depends on comprehensive geographic coverage (15,000+ funeral homes [[35]]), accurate pricing data, and building trust through educational content during an emotionally challenging user journey.
