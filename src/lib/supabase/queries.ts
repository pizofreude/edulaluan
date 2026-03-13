import type { Database } from '@/types/supabase'

type Resource = Database['public']['Tables']['resources']['Row']
type Category = Database['public']['Tables']['categories']['Row']
type IncomeGroup = Database['public']['Tables']['income_groups']['Row']
type EducationLevel = Database['public']['Tables']['education_levels']['Row']
type Language = Database['public']['Tables']['languages']['Row']
type Tag = Database['public']['Tables']['tags']['Row']
type CostType = Database['public']['Tables']['cost_types']['Row']
type DeliveryMode = Database['public']['Tables']['delivery_modes']['Row']

export interface ResourceWithRelations extends Resource {
  category: Category | null
  cost_type: CostType | null
  mode: DeliveryMode | null
  income_groups: Array<{ income_groups: IncomeGroup }>
  education_levels: Array<{ education_levels: EducationLevel }>
  languages: Array<{ languages: Language }>
  tags: Array<{ tags: Tag }>
}

/**
 * Fetch all resources with full relations
 */
export async function fetchResources(supabase: any) {
  const { data, error } = await supabase
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
    .order('created_at', { ascending: false })

  if (error) throw error
  return data as ResourceWithRelations[]
}

/**
 * Fetch featured resources
 */
export async function fetchFeaturedResources(supabase: any, limit = 6) {
  const { data, error } = await supabase
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
    .eq('is_featured', true)
    .limit(limit)

  if (error) throw error
  return data as ResourceWithRelations[]
}

/**
 * Fetch resources filtered by category and income group
 */
export async function fetchFilteredResources(
  supabase: any,
  categoryId?: string,
  incomeGroupSlug?: string
) {
  let query = supabase
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

  if (categoryId) {
    query = query.eq('category_id', categoryId)
  }

  if (incomeGroupSlug) {
    query = query.in(
      'resource_income_groups.income_group_id',
      supabase
        .from('income_groups')
        .select('id')
        .eq('slug', incomeGroupSlug)
    )
  }

  const { data, error } = await query

  if (error) throw error
  return data as ResourceWithRelations[]
}

/**
 * Fetch all categories
 */
export async function fetchCategories(supabase: any) {
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .order('name')

  if (error) throw error
  return data as Category[]
}

/**
 * Fetch all income groups
 */
export async function fetchIncomeGroups(supabase: any) {
  const { data, error } = await supabase
    .from('income_groups')
    .select('*')
    .order('name')

  if (error) throw error
  return data as IncomeGroup[]
}

/**
 * Fetch all education levels
 */
export async function fetchEducationLevels(supabase: any) {
  const { data, error } = await supabase
    .from('education_levels')
    .select('*')
    .order('name')

  if (error) throw error
  return data as EducationLevel[]
}

/**
 * Search resources by keyword
 */
export async function searchResources(supabase: any, searchTerm: string) {
  const { data, error } = await supabase
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
    .or(`name.ilike.%${searchTerm}%,description.ilike.%${searchTerm}%`)
    .order('name')

  if (error) throw error
  return data as ResourceWithRelations[]
}
