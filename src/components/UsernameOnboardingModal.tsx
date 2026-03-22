import * as React from "react";
import { cn } from "../lib/utils";
import { validateUsername, generateSuggestions, USERNAME_RULES } from "../lib/username";

interface UsernameOnboardingModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSuccess: (username: string) => void;
  skipLabel?: string;
  title?: string;
  description?: string;
}

export function UsernameOnboardingModal({ 
  isOpen, 
  onClose, 
  onSuccess,
  skipLabel = "Skip for Now",
  title = "Choose Your Username",
  description = "Pick a unique username that will represent you on leaderboards and contributions. You can change it once every 90 days."
}: UsernameOnboardingModalProps) {
  const [username, setUsername] = React.useState("");
  const [checking, setChecking] = React.useState(false);
  const [available, setAvailable] = React.useState<boolean | null>(null);
  const [error, setError] = React.useState("");
  const [suggestions, setSuggestions] = React.useState<string[]>([]);
  const [accessToken, setAccessToken] = React.useState<string | null>(null);

  // Get auth token on mount
  React.useEffect(() => {
    let mounted = true;

    const getAuth = async () => {
      try {
        const { createClient } = await import('@supabase/supabase-js');
        const supabase = createClient(
          import.meta.env.PUBLIC_SUPABASE_URL,
          import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY
        );

        const { data: { session } } = await supabase.auth.getSession();

        if (mounted) {
          setAccessToken(session?.access_token || null);
        }
      } catch (error) {
        console.error('[UsernameModal] Auth check failed:', error);
      }
    };

    getAuth();

    return () => {
      mounted = false;
    };
  }, []);

  // Debounced availability check
  React.useEffect(() => {
    const timer = setTimeout(async () => {
      if (username.length >= 3) {
        setChecking(true);
        setError("");
        
        try {
          const response = await fetch('/api/user/check-username', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username })
          });
          const result = await response.json();
          
          setAvailable(result.available);
          setError(result.error || '');
          setSuggestions(result.suggestions || []);
        } catch (err) {
          console.error('[UsernameModal] Availability check failed:', err);
          setError('Failed to check availability');
          setAvailable(null);
        } finally {
          setChecking(false);
        }
      } else {
        setAvailable(null);
        setError("");
        setSuggestions([]);
      }
    }, 500);

    return () => clearTimeout(timer);
  }, [username]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!accessToken) {
      setError('Authentication required. Please log in again.');
      return;
    }

    try {
      const response = await fetch('/api/user/set-username', {
        method: 'POST',
        headers: { 
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${accessToken}`
        },
        body: JSON.stringify({ username: username.trim() })
      });

      const result = await response.json();

      if (!response.ok) {
        if (result.cooldown) {
          setError(`You can only change your username once every ${USERNAME_RULES.COOLDOWN_DAYS} days. ${result.daysRemaining} days remaining.`);
        } else {
          setError(result.error || 'Failed to set username');
        }
        return;
      }

      onSuccess(result.username);
    } catch (err: any) {
      console.error('[UsernameModal] Submit failed:', err);
      setError(err.message || 'Failed to set username');
    }
  };

  const handleSuggestionClick = (suggestion: string) => {
    setUsername(suggestion);
  };

  const handleSkip = () => {
    // User can skip and set later in settings
    onClose();
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm">
      <div className="bg-surface-elevated rounded-xl border shadow-xl max-w-md w-full animate-in fade-in zoom-in duration-200">
        {/* Header */}
        <div className="p-6 border-b">
          <div className="flex items-start justify-between">
            <div>
              <h2 className="text-2xl font-bold text-foreground">{title}</h2>
              <p className="text-sm text-muted-foreground mt-1">{description}</p>
            </div>
            <button
              onClick={onClose}
              className="text-muted-foreground hover:text-foreground transition-colors"
              aria-label="Close"
            >
              <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit} className="p-6 space-y-4">
          <div>
            <label htmlFor="username" className="block text-sm font-medium text-foreground mb-1">
              Username *
            </label>
            <div className="relative">
              <input
                type="text"
                id="username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                className={cn(
                  "w-full px-3 py-2 border rounded-md pr-24 bg-background text-foreground focus:outline-none focus:ring-2 focus:ring-primary transition-colors",
                  available === false ? "border-red-300 focus:ring-red-500" : "border-border"
                )}
                placeholder="e.g., AhmadR, GaryW, SarahM"
                pattern="^[a-zA-Z][a-zA-Z0-9_]*$"
                minLength={3}
                maxLength={30}
                autoComplete="off"
                autoCorrect="off"
                spellCheck="false"
                required
              />
              {checking && (
                <span className="absolute right-3 top-2 text-sm text-muted-foreground flex items-center gap-1">
                  <svg className="animate-spin h-4 w-4" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                  </svg>
                  Checking...
                </span>
              )}
              {available === true && !checking && (
                <span className="absolute right-3 top-2 text-sm text-green-600 font-medium flex items-center gap-1">
                  <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                  Available
                </span>
              )}
              {available === false && !checking && error && (
                <span className="absolute right-3 top-2 text-sm text-red-600 font-medium">
                  ✗ Taken
                </span>
              )}
            </div>
            
            {/* Validation Rules */}
            <div className="mt-2 text-xs text-muted-foreground space-y-1">
              <p>• 3-30 characters</p>
              <p>• Letters, numbers, and underscores only</p>
              <p>• Must start with a letter</p>
            </div>

            {/* Error Message */}
            {error && (
              <div className="mt-3 p-3 bg-red-50 border border-red-200 rounded-lg">
                <p className="text-sm text-red-800">{error}</p>
              </div>
            )}

            {/* Suggestions */}
            {suggestions.length > 0 && (
              <div className="mt-3">
                <p className="text-xs font-medium text-muted-foreground mb-2">Try these instead:</p>
                <div className="flex flex-wrap gap-2">
                  {suggestions.map((suggestion) => (
                    <button
                      key={suggestion}
                      type="button"
                      onClick={() => handleSuggestionClick(suggestion)}
                      className="px-3 py-1 text-sm bg-surface hover:bg-surface-elevated border rounded-full transition-colors"
                    >
                      @{suggestion}
                    </button>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* Actions */}
          <div className="flex gap-3 pt-4">
            <button
              type="submit"
              disabled={!available || checking || !username.trim()}
              className="flex-1 px-4 py-2 bg-primary text-white font-semibold rounded-lg hover:bg-primary/90 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {username ? 'Save Username' : 'Choose Username'}
            </button>
            <button
              type="button"
              onClick={handleSkip}
              className="px-4 py-2 border border-border bg-background text-foreground font-semibold rounded-lg hover:bg-surface-elevated transition-colors"
            >
              {skipLabel}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
