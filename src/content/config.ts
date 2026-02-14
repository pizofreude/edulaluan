import { defineCollection, z } from 'astro:content';

const resources = defineCollection({
  type: 'data',
  schema: z.object({
    name: z.string(),
    provider: z.string(),
    description: z.string(),
    url: z.string().url(),
    category: z.enum(['scholarship', 'mooc', 'tvet', 'financial-aid', 'digital-skills', 'degree', 'secondary-education', 'community', 'elite-institutions', 'other']),
    incomeGroups: z.array(z.enum(['B40', 'M40', 'T20'])),
    cost: z.enum(['free', 'subsidized', 'paid']),
    mode: z.enum(['online', 'in-person', 'hybrid']),
    language: z.array(z.enum(['en', 'ms', 'zh', 'ta'])),
    tags: z.array(z.string()),
    featured: z.boolean().default(false),
    educationLevel: z.array(z.enum(['primary', 'secondary', 'post-secondary', 'tertiary', 'all-levels'])).optional(),
  }),
});

export const collections = { resources };
