# Supabase Backend Setup Guide

## Quick Start

### 1. Create Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Sign in / Create account
3. Click "New Project"
4. Fill in:
   - **Name**: edulaluan
   - **Database Password**: (save this securely!)
   - **Region**: Choose closest to Malaysia (Singapore/Tokyo)
5. Wait for project to provision (~2 minutes)

### 2. Get API Credentials

1. Go to Project Settings → API
2. Copy these values:
   - **Project URL**: `https://xxxxx.supabase.co`
   - **anon/public key**: `eyJhbG...` (safe for browser)

### 3. Configure Environment Variables

Create `.env` file in project root:

```bash
PUBLIC_SUPABASE_URL=https://your-project-ref.supabase.co
PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

### 4. Link Local Project

```bash
npm run supabase:link
```

Select your project when prompted, or:

```bash
npx supabase link --project-ref your-project-ref
```

### 5. Push Database Schema

```bash
npm run db:push
```

This applies the migration in `supabase/migrations/001_initial_schema.sql`

### 6. Seed Database with Resources

```bash
npm run db:seed
```

This loads all 138 education resources from `supabase/seed.sql`

---

## Local Development (Optional)

### Start Local Supabase Stack

Requires Docker Desktop running:

```bash
npm run supabase:start
```

### Stop Local Stack

```bash
npm run supabase:stop
```

### Generate TypeScript Types

After schema changes:

```bash
npm run supabase:gen-types
```

---

## Database Schema Overview

### Core Tables

- **resources** - Education opportunities (138 entries)
- **providers** - Organizations offering resources
- **categories** - Resource types (scholarship, mooc, tvet, etc.)
- **income_groups** - B40, M40, T20 reference table
- **education_levels** - Primary, Secondary, Post-Secondary, Tertiary, All-Levels
- **cost_types** - Free, Subsidized, Paid
- **delivery_modes** - Online, In-Person, Hybrid
- **languages** - EN, MS, ZH, TA
- **tags** - Keyword tags for resources

### Junction Tables (Many-to-Many)

- **resource_income_groups** - Which income groups a resource serves
- **resource_education_levels** - Which education levels a resource targets
- **resource_languages** - Available languages
- **resource_tags** - Associated tags

---

## Query Examples

### Get all resources with filters

```typescript
import { createClient } from '@/lib/supabase/server'

const supabase = createClient(cookieHeader)

const { data: resources } = await supabase
  .from('resources')
  .select(`
    *,
    category:categories(slug, name),
    cost_type:cost_types(slug, name),
    mode:delivery_modes(slug, name),
    income_groups:resource_income_groups(
      income_groups:income_groups(slug, name)
    ),
    education_levels:resource_education_levels(
      education_levels:education_levels(slug, name)
    ),
    languages:resource_languages(
      languages:languages(code, name)
    ),
    tags:resource_tags(
      tags:tags(slug, name)
    )
  `)
  .eq('category_id', categoryUuid);
```

### Search resources by keyword

```typescript
const { data: resources } = await supabase
  .from('resources')
  .select('*')
  .or(`name.ilike.%${searchTerm}%,description.ilike.%${searchTerm}%`);
```

### Filter by income group

```typescript
const { data: resources } = await supabase
  .from('resources')
  .select(`*, resource_income_groups(income_group_id)`)
  .in('resource_income_groups.income_group_id', ['b40-uuid', 'm40-uuid']);
```

---

## Row Level Security (RLS)

All tables have RLS enabled. Current policies:

- ✅ **Public read access** - Anyone can view resources and reference data
- 🔒 **Write access** - Requires authentication (future feature)

When auth is enabled, update policies in `001_initial_schema.sql`

---

## Migration History

- **001_initial_schema** - Core schema with RLS, triggers, and reference data

---

## Troubleshooting

### "Failed to connect to Docker"

Start Docker Desktop before running `supabase start`

### "No linked projects"

Run `npx supabase link` to connect to your Supabase project

### "TypeScript types outdated"

Run `npm run supabase:gen-types` to regenerate types from schema

---

## Next Steps

1. ✅ Database schema created
2. ✅ Seed data loaded (138 resources)
3. ✅ TypeScript types generated
4. 🔄 Update frontend components to use Supabase queries
5. 🔮 Add user authentication (optional)
6. 🔮 Add resource verification system (future)
7. 🔮 Add analytics tracking (future)
