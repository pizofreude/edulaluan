export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      categories: {
        Row: {
          id: string
          name: string
          slug: string
          description: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          description?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          description?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      income_groups: {
        Row: {
          id: string
          name: string
          slug: string
          description: string | null
          min_income: number | null
          max_income: number | null
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          description?: string | null
          min_income?: number | null
          max_income?: number | null
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          description?: string | null
          min_income?: number | null
          max_income?: number | null
          created_at?: string
        }
      }
      education_levels: {
        Row: {
          id: string
          name: string
          slug: string
          description: string | null
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          description?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          description?: string | null
          created_at?: string
        }
      }
      cost_types: {
        Row: {
          id: string
          name: string
          slug: string
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          created_at?: string
        }
      }
      delivery_modes: {
        Row: {
          id: string
          name: string
          slug: string
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          created_at?: string
        }
      }
      languages: {
        Row: {
          id: string
          name: string
          code: string
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          code: string
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          code?: string
          created_at?: string
        }
      }
      providers: {
        Row: {
          id: string
          name: string
          description: string | null
          website_url: string | null
          logo_url: string | null
          is_verified: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          description?: string | null
          website_url?: string | null
          logo_url?: string | null
          is_verified?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          description?: string | null
          website_url?: string | null
          logo_url?: string | null
          is_verified?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      resources: {
        Row: {
          id: string
          name: string
          provider_id: string | null
          provider_name: string
          description: string
          url: string
          category_id: string | null
          cost_type_id: string | null
          mode_id: string | null
          is_featured: boolean
          view_count: number
          verification_count: number
          last_verified_at: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          provider_id?: string | null
          provider_name: string
          description: string
          url: string
          category_id?: string | null
          cost_type_id?: string | null
          mode_id?: string | null
          is_featured?: boolean
          view_count?: number
          verification_count?: number
          last_verified_at?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          provider_id?: string | null
          provider_name?: string
          description?: string
          url?: string
          category_id?: string | null
          cost_type_id?: string | null
          mode_id?: string | null
          is_featured?: boolean
          view_count?: number
          verification_count?: number
          last_verified_at?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      tags: {
        Row: {
          id: string
          name: string
          slug: string
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          created_at?: string
        }
      }
      resource_income_groups: {
        Row: {
          resource_id: string
          income_group_id: string
          created_at: string
        }
        Insert: {
          resource_id: string
          income_group_id: string
          created_at?: string
        }
        Update: {
          resource_id?: string
          income_group_id?: string
          created_at?: string
        }
      }
      resource_education_levels: {
        Row: {
          resource_id: string
          education_level_id: string
          created_at: string
        }
        Insert: {
          resource_id: string
          education_level_id: string
          created_at?: string
        }
        Update: {
          resource_id?: string
          education_level_id?: string
          created_at?: string
        }
      }
      resource_languages: {
        Row: {
          resource_id: string
          language_id: string
          created_at: string
        }
        Insert: {
          resource_id: string
          language_id: string
          created_at?: string
        }
        Update: {
          resource_id?: string
          language_id?: string
          created_at?: string
        }
      }
      resource_tags: {
        Row: {
          resource_id: string
          tag_id: string
          created_at: string
        }
        Insert: {
          resource_id: string
          tag_id: string
          created_at?: string
        }
        Update: {
          resource_id?: string
          tag_id?: string
          created_at?: string
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      increment_resource_view_count: {
        Args: {
          p_resource_id: string
        }
        Returns: undefined
      }
    }
    Enums: {
      [_ in never]: never
    }
  }
}

// Helper types for queries
export type ResourceWithRelations = Database['public']['Tables']['resources']['Row'] & {
  income_groups: Array<{ name: string; slug: string }>
  education_levels: Array<{ name: string; slug: string }>
  languages: Array<{ name: string; code: string }>
  tags: Array<{ name: string; slug: string }>
  category: { name: string; slug: string } | null
  cost_type: { name: string; slug: string } | null
  mode: { name: string; slug: string } | null
}
