import { useEffect } from 'react';
import { createClient } from '../lib/supabase/client';

/**
 * Identifies logged-in Supabase users with the Callout widget.
 * Renders nothing — purely handles window.Callout.identify() calls.
 * Must be mounted with client:only="react" in Layout.astro.
 */
export default function CalloutIdentify() {
  useEffect(() => {
    const supabase = createClient();

    function identify(user: { id: string; email?: string; user_metadata?: Record<string, unknown> }) {
      window.Callout?.identify({
        id: user.id,
        email: user.email ?? '',
        name: (user.user_metadata?.full_name as string) ?? user.email ?? '',
      });
    }

    // Identify on initial load if already signed in
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session?.user) identify(session.user);
    });

    // Re-identify on login, clear on logout
    const { data: { subscription } } = supabase.auth.onAuthStateChange((event, session) => {
      if (event === 'SIGNED_IN' && session?.user) {
        identify(session.user);
      }
    });

    return () => subscription.unsubscribe();
  }, []);

  return null;
}
