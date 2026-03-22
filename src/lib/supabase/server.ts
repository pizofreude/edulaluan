import { createServerClient } from '@supabase/ssr'

export function createClient(cookieHeader: string | null) {
  return createServerClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
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
