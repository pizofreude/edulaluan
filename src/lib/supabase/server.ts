import { createServerClient } from '@supabase/ssr'

export function createClient(cookieHeader: string | null) {
  // Use new API key model (2025/2026) with fallback to legacy
  const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
  const supabaseKey = import.meta.env.SUPABASE_SECRET_KEY || import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY || import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;

  return createServerClient(
    supabaseUrl,
    supabaseKey,
    {
      cookies: {
        getAll() {
          if (!cookieHeader) return []
          return cookieHeader.split(';').map((cookie) => {
            const [name, ...valueParts] = cookie.split('=')
            const value = valueParts.join('=')
            return { name, value }
          })
        },
        setAll(cookiesToSet) {
          // In Astro SSR, we can't directly set cookies from server components
          // This is handled by the API routes for auth operations
          // eslint-disable-next-line @typescript-eslint/no-unused-vars
          cookiesToSet.forEach(({ name, value, options }) => {
            // For SSR reads, we just need to parse incoming cookies
            // Setting cookies happens in API routes
          })
        },
      },
    }
  )
}
