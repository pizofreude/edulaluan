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
      const payload: { id: string; email?: string; name: string } = {
        id: user.id,
        name: (user.user_metadata?.full_name as string) ?? user.email ?? '',
      };

      if (user.email) {
        payload.email = user.email;
      }

      window.Callout?.identify(payload);
    }

    // Identify on initial load if already signed in
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session?.user) identify(session.user);
    });

    // Re-identify on login, destroy widget session on logout
    const { data: { subscription } } = supabase.auth.onAuthStateChange((event, session) => {
      if (event === 'SIGNED_IN' && session?.user) {
        identify(session.user);
      } else if (event === 'SIGNED_OUT') {
        window.Callout?.destroy();
      }
    });

    return () => subscription.unsubscribe();
  }, []);

  return null;
}
