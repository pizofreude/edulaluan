import * as React from "react";
import { cn } from "../lib/utils";

// Sample submissions data (to be replaced with backend data)
interface Submission {
  id: string;
  gender: "male" | "female";
  contributorName: string;
  isAnonymous: boolean;
  clinicName: string;
  location: string;
  method: string;
  methodOther?: string; // Custom method when "Other" is selected
  practitionerName?: string;
  clinicContact?: string;
  experience: string;
  submittedAt: string;
}

const sampleSubmissions: Submission[] = [
  {
    id: "1",
    gender: "male",
    contributorName: "Ahmad R.",
    isAnonymous: false,
    clinicName: "Klinik Kesihatan Cheras",
    location: "Cheras, Kuala Lumpur",
    method: "Conventional sleeve",
    practitionerName: "Dr. Azman",
    clinicContact: "03-9074 2020",
    experience: "Process was smooth. Doctor explained everything clearly. Recovery took about 1 week for desk work. Cost was very affordable at government clinic (RM80 total). Staff were respectful and understanding as a revert.",
    submittedAt: "2026-03-15",
  },
  {
    id: "2",
    gender: "male",
    contributorName: "Gary W.",
    isAnonymous: false,
    clinicName: "Universal Clinic",
    location: "Ampang, Kuala Lumpur",
    method: "Stapler/ZSR",
    practitionerName: "Dr. Shalan",
    clinicContact: "https://www.universalclinic.com.my",
    experience: "The care I received was exceptional. From consultation to recovery, the staff showed genuine compassion. The Stapler method meant less bleeding and faster recovery. Worth the investment for the professionalism and comfort.",
    submittedAt: "2026-03-10",
  },
  {
    id: "3",
    gender: "male",
    contributorName: "Anonymous",
    isAnonymous: true,
    clinicName: "KPJ Ampang Puteri",
    location: "Ampang, Selangor",
    method: "Laser",
    experience: "Chose laser for precision. Procedure was quick (45 mins). Went home same day. Pain was manageable with medication. Took 10 days off physical work. Staff were professional and didn't make me feel awkward about being a revert.",
    submittedAt: "2026-03-08",
  },
  {
    id: "4",
    gender: "female",
    contributorName: "Sarah M.",
    isAnonymous: false,
    clinicName: "KPJ Ampang Puteri Specialist Hospital",
    location: "Kuala Lumpur",
    method: "Needle prick only",
    practitionerName: "Dr. Ariza Mohamed",
    experience: "Important to clarify: this was ONLY a gentle needle prick on the clitoral hood. No cutting, no tissue removal. The doctor explained the difference between this and FGM clearly. It's symbolic, not invasive. Recovery was immediate.",
    submittedAt: "2026-03-05",
  },
];

const maleMethods = [
  "Conventional sleeve",
  "Dorsal slit",
  "Laser",
  "TaraKlamp",
  "Alisklamp",
  "Plastibell",
  "Stapler/ZSR",
  "Other",
];

const femaleMethods = ["Needle prick only", "Other"];

interface CircumcisionWidgetProps {
  className?: string;
}

export function CircumcisionWidget({ className }: CircumcisionWidgetProps) {
  const [isLoggedIn, setIsLoggedIn] = React.useState(false);
  const [filter, setFilter] = React.useState<"all" | "male" | "female">("all");
  const [expandedId, setExpandedId] = React.useState<string | null>(null);
  const [showForm, setShowForm] = React.useState(false);
  const [formSubmitted, setFormSubmitted] = React.useState(false);
  const [formData, setFormData] = React.useState({
    displayName: "",
    isAnonymous: false,
    gender: "" as "male" | "female",
    method: "",
    methodOther: "", // Custom method when "Other" is selected
    clinicName: "",
    location: "",
    practitionerName: "",
    clinicContact: "",
    experience: "",
  });

  // Check auth status on mount
  React.useEffect(() => {
    let mounted = true;

    const checkAuth = async () => {
      try {
        const { createClient } = await import('@supabase/supabase-js');
        const supabase = createClient(
          import.meta.env.PUBLIC_SUPABASE_URL,
          import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY || import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY
        );

        const { data: { session } } = await supabase.auth.getSession();
        
        if (mounted) {
          setIsLoggedIn(!!session);
          console.log('[CircumcisionWidget] Auth check - logged in:', !!session);
        }
      } catch (error) {
        console.error('[CircumcisionWidget] Auth check failed:', error);
        if (mounted) setIsLoggedIn(false);
      }
    };

    checkAuth();

    return () => {
      mounted = false;
    };
  }, []);

  const filteredSubmissions = React.useMemo(() => {
    if (filter === "all") return sampleSubmissions;
    return sampleSubmissions.filter((s) => s.gender === filter);
  }, [filter]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    // Validation
    if (!formData.displayName && !formData.isAnonymous) {
      alert("Please enter a display name or toggle anonymous");
      return;
    }
    if (!formData.gender) {
      alert("Please select gender");
      return;
    }
    if (!formData.method) {
      alert("Please select method");
      return;
    }
    if (formData.method === "Other" && !formData.methodOther.trim()) {
      alert("Please specify the method");
      return;
    }
    if (!formData.clinicName) {
      alert("Please enter clinic/hospital name");
      return;
    }
    if (!formData.location) {
      alert("Please enter location");
      return;
    }
    if (formData.experience.length < 30) {
      alert("Experience must be at least 30 characters");
      return;
    }

    try {
      // Get auth token
      const { createClient } = await import('@supabase/supabase-js');
      const supabase = createClient(
        import.meta.env.PUBLIC_SUPABASE_URL,
        import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY || import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY
      );

      const { data: { session } } = await supabase.auth.getSession();

      // Submit to API
      const response = await fetch('/api/circumcision/submit', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...(session?.access_token ? { 'Authorization': `Bearer ${session.access_token}` } : {})
        },
        body: JSON.stringify(formData),
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(result.error || 'Failed to submit');
      }

      console.log('[CircumcisionWidget] Submission successful:', result.submissionId);
      setFormSubmitted(true);
      
      // Reset form after delay
      setTimeout(() => {
        setShowForm(false);
        setFormSubmitted(false);
        setFormData({
          displayName: "",
          isAnonymous: false,
          gender: "" as "male" | "female",
          method: "",
          methodOther: "",
          clinicName: "",
          location: "",
          practitionerName: "",
          clinicContact: "",
          experience: "",
        });
      }, 3000);

    } catch (error: any) {
      console.error('[CircumcisionWidget] Submission error:', error);
      alert(error.message || 'Failed to submit. Please try again.');
    }
  };

  const toggleExpand = (id: string) => {
    setExpandedId(expandedId === id ? null : id);
  };

  const handleGenderChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const gender = e.target.value as "male" | "female";
    setFormData((prev) => ({
      ...prev,
      gender,
      method: gender === "female" ? "Needle prick only" : "",
      methodOther: "", // Reset custom method when gender changes
    }));
  };

  return (
    <div className={cn("w-full", className)}>
      {/* Filter Bar */}
      <div className="flex items-center justify-between mb-6 p-4 bg-surface-elevated rounded-xl shadow-sm border">
        <div className="flex gap-2">
          <button
            onClick={() => setFilter("all")}
            className={cn(
              "px-4 py-2.5 rounded-lg text-sm font-semibold transition-all shadow-sm",
              filter === "all"
                ? "bg-teal-700 text-white hover:bg-teal-800"
                : "bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700"
            )}
          >
            All
          </button>
          <button
            onClick={() => setFilter("male")}
            className={cn(
              "px-4 py-2.5 rounded-lg text-sm font-semibold transition-all shadow-sm",
              filter === "male"
                ? "bg-teal-700 text-white hover:bg-teal-800"
                : "bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700"
            )}
          >
            Male (Sunat Lelaki)
          </button>
          <button
            onClick={() => setFilter("female")}
            className={cn(
              "px-4 py-2.5 rounded-lg text-sm font-semibold transition-all shadow-sm",
              filter === "female"
                ? "bg-teal-700 text-white hover:bg-teal-800"
                : "bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700"
            )}
          >
            Female (Sunat Perempuan)
          </button>
        </div>
        <div className="inline-flex items-center gap-2 bg-teal-100 dark:bg-teal-900/30 text-teal-900 dark:text-teal-100 px-3 py-1.5 rounded-full text-sm font-semibold">
          <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
          {filteredSubmissions.length} submission
          {filteredSubmissions.length !== 1 ? "s" : ""}
        </div>
      </div>

      {/* Submissions List */}
      <div className="space-y-4 mb-8">
        {filteredSubmissions.map((submission) => (
          <div
            key={submission.id}
            className="border rounded-xl bg-surface-elevated overflow-hidden transition-all shadow-sm hover:shadow-md"
          >
            {/* Preview - Clickable Header */}
            <button
              type="button"
              className="w-full flex items-center justify-between p-5 hover:bg-surface/50 transition-colors text-left"
              onClick={() => toggleExpand(submission.id)}
              aria-expanded={expandedId === submission.id}
              aria-controls={`submission-content-${submission.id}`}
            >
              <div className="flex items-center gap-3 flex-wrap">
                <span
                  className={cn(
                    "px-3 py-1.5 rounded-lg text-xs font-bold",
                    submission.gender === "male"
                      ? "bg-blue-100 text-blue-900 dark:bg-blue-900 dark:text-blue-100"
                      : "bg-pink-100 text-pink-900 dark:bg-pink-900 dark:text-pink-100"
                  )}
                >
                  {submission.gender === "male" ? "Male" : "Female"}
                </span>
                <span className="font-bold text-foreground text-base">
                  {submission.isAnonymous
                    ? "Anonymous"
                    : submission.contributorName}
                </span>
                <span className="text-muted-foreground hidden sm:inline">•</span>
                <span className="text-foreground font-medium">
                  {submission.clinicName}
                </span>
                <span className="text-muted-foreground">
                  ({submission.location})
                </span>
              </div>
              <div className="flex items-center gap-3 flex-shrink-0 ml-3">
                <span className="px-3 py-1.5 bg-teal-100 dark:bg-teal-900/30 text-teal-900 dark:text-teal-100 rounded-lg text-xs font-bold hidden sm:inline-block">
                  {submission.method === "Other" && submission.methodOther 
                    ? submission.methodOther 
                    : submission.method}
                </span>
                <svg
                  className={cn(
                    "w-6 h-6 text-muted-foreground transition-transform duration-200",
                    expandedId === submission.id && "rotate-180"
                  )}
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  style={{ transform: expandedId === submission.id ? 'rotate(180deg)' : 'rotate(0deg)' }}
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M19 9l-7 7-7-7"
                  />
                </svg>
              </div>
            </button>

            {/* Expanded Details */}
            {expandedId === submission.id && (
              <div id={`submission-content-${submission.id}`} className="border-t bg-surface/50 p-5 space-y-4">
                <div className="grid gap-4">
                  <div className="grid sm:grid-cols-2 gap-4">
                    <div>
                      <span className="text-sm font-bold text-foreground flex items-center gap-2">
                        <svg className="w-4 h-4 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                        </svg>
                        Clinic/Hospital:
                      </span>
                      <p className="text-foreground mt-1">{submission.clinicName}</p>
                    </div>
                    <div>
                      <span className="text-sm font-bold text-foreground flex items-center gap-2">
                        <svg className="w-4 h-4 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                        Location:
                      </span>
                      <p className="text-foreground mt-1">{submission.location}</p>
                    </div>
                  </div>
                  {submission.practitionerName && (
                    <div>
                      <span className="text-sm font-bold text-foreground flex items-center gap-2">
                        <svg className="w-4 h-4 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        Practitioner:
                      </span>
                      <p className="text-foreground mt-1">{submission.practitionerName}</p>
                    </div>
                  )}
                  {submission.clinicContact && (
                    <div>
                      <span className="text-sm font-bold text-foreground flex items-center gap-2">
                        <svg className="w-4 h-4 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                        </svg>
                        Contact:
                      </span>
                      <p className="text-foreground mt-1">{submission.clinicContact}</p>
                    </div>
                  )}
                  <div>
                    <span className="text-sm font-bold text-foreground flex items-center gap-2">
                      <svg className="w-4 h-4 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z" />
                      </svg>
                      Method:
                    </span>
                    <p className="text-foreground mt-1">
                      {submission.method === "Other" && submission.methodOther 
                        ? `${submission.method} - ${submission.methodOther}`
                        : submission.method}
                    </p>
                  </div>
                  <div>
                    <span className="text-sm font-bold text-foreground flex items-center gap-2">
                      <svg className="w-4 h-4 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
                      </svg>
                      Experience:
                    </span>
                    <p className="text-foreground mt-2 leading-relaxed">
                      {submission.experience}
                    </p>
                  </div>
                  <div className="pt-3 border-t">
                    <span className="text-xs text-muted-foreground flex items-center gap-2">
                      <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                      </svg>
                      Submitted: {submission.submittedAt}
                    </span>
                  </div>
                </div>
              </div>
            )}
          </div>
        ))}
      </div>

      {/* Contribution Section */}
      <div className="border-t pt-8">
        <h3 className="text-xl font-bold text-foreground mb-2">
          Share Your Experience
        </h3>
        <p className="text-muted-foreground mb-4">
          Help other reverts by sharing your circumcision experience. All
          submissions are reviewed before publishing.
        </p>

        {!isLoggedIn ? (
          <div className="p-6 bg-blue-100 dark:bg-blue-900/30 border-2 border-blue-300 dark:border-blue-700 rounded-xl shadow-sm">
            <p className="text-sm text-blue-950 dark:text-blue-50 mb-4 font-semibold">
              You need to be logged in to share your experience.
            </p>
            <a
              href="/auth/login"
              className="inline-flex items-center gap-2 bg-teal-700 text-white px-5 py-3 rounded-lg hover:bg-teal-800 transition-all font-semibold shadow-md hover:shadow-lg"
            >
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1" />
              </svg>
              Login to Share
            </a>
          </div>
        ) : showForm ? (
          formSubmitted ? (
            <div className="p-6 bg-green-100 dark:bg-green-900/30 border-2 border-green-300 dark:border-green-700 rounded-xl shadow-sm">
              <div className="flex items-center gap-3 mb-3">
                <svg className="w-6 h-6 text-green-700 dark:text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
                <h4 className="font-bold text-green-950 dark:text-green-100">
                  Submission Received!
                </h4>
              </div>
              <p className="text-sm text-green-900 dark:text-green-200">
                Thank you for sharing. Your experience will be reviewed and published within 2-3 business days.
              </p>
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-4 p-6 bg-muted rounded-xl">
              {/* Display Name */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Display Name
                </label>
                <input
                  type="text"
                  value={formData.displayName}
                  onChange={(e) =>
                    setFormData((prev) => ({
                      ...prev,
                      displayName: e.target.value,
                    }))
                  }
                  disabled={formData.isAnonymous}
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                  placeholder="Your name or username"
                />
                <label className="flex items-center gap-2 mt-2">
                  <input
                    type="checkbox"
                    checked={formData.isAnonymous}
                    onChange={(e) =>
                      setFormData((prev) => ({
                        ...prev,
                        isAnonymous: e.target.checked,
                      }))
                    }
                    className="w-4 h-4 rounded border-input"
                  />
                  <span className="text-sm text-muted-foreground">
                    Post as Anonymous
                  </span>
                </label>
              </div>

              {/* Gender */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Gender <span className="text-red-500">*</span>
                </label>
                <select
                  value={formData.gender}
                  onChange={handleGenderChange}
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                >
                  <option value="">Select gender</option>
                  <option value="male">Male</option>
                  <option value="female">Female</option>
                </select>
              </div>

              {/* Female Sunat Notice */}
              {formData.gender === "female" && (
                <div className="p-4 bg-teal-50 dark:bg-teal-900/20 border border-teal-200 dark:border-teal-800 rounded-lg">
                  <p className="text-sm text-teal-800 dark:text-teal-200">
                    <strong>Important:</strong> Female sunat (circumcision) in Islam involves ONLY a gentle needle prick on the clitoral hood. There is NO cutting, NO tissue removal, and NO lasting anatomical change. This is fundamentally different from FGM (Female Genital Mutilation), which is harmful and forbidden.
                  </p>
                </div>
              )}

              {/* Method */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Method <span className="text-red-500">*</span>
                </label>
                <select
                  value={formData.method}
                  onChange={(e) =>
                    setFormData((prev) => ({ ...prev, method: e.target.value }))
                  }
                  disabled={formData.gender === "female"}
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary disabled:opacity-50"
                >
                  <option value="">Select method</option>
                  {formData.gender === "male" &&
                    maleMethods.map((method) => (
                      <option key={method} value={method}>
                        {method}
                      </option>
                    ))}
                  {formData.gender === "female" &&
                    femaleMethods.map((method) => (
                      <option key={method} value={method}>
                        {method}
                      </option>
                    ))}
                </select>
                {formData.gender === "female" && (
                  <p className="text-xs text-muted-foreground mt-1">
                    Female circumcision is a symbolic needle prick only — no cutting or tissue removal.
                  </p>
                )}
              </div>

              {/* Custom Method Input (when "Other" is selected) */}
              {formData.method === "Other" && (
                <div>
                  <label className="block text-sm font-medium text-foreground mb-2">
                    Specify Method <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    value={formData.methodOther}
                    onChange={(e) =>
                      setFormData((prev) => ({
                        ...prev,
                        methodOther: e.target.value,
                      }))
                    }
                    className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                    placeholder="e.g. SmartKlamp, Laser-assisted, etc."
                    minLength={3}
                  />
                  <p className="text-xs text-muted-foreground mt-1">
                    Please specify the circumcision method used (minimum 3 characters)
                  </p>
                </div>
              )}

              {/* Clinic Name */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Clinic/Hospital Name <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={formData.clinicName}
                  onChange={(e) =>
                    setFormData((prev) => ({
                      ...prev,
                      clinicName: e.target.value,
                    }))
                  }
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                  placeholder="e.g. Klinik Kesihatan Cheras"
                />
              </div>

              {/* Location */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Location (City, State) <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={formData.location}
                  onChange={(e) =>
                    setFormData((prev) => ({
                      ...prev,
                      location: e.target.value,
                    }))
                  }
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                  placeholder="e.g. Cheras, Kuala Lumpur"
                />
              </div>

              {/* Practitioner Name (Optional) */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Doctor/Practitioner Name{" "}
                  <span className="text-muted-foreground font-normal">
                    (optional)
                  </span>
                </label>
                <input
                  type="text"
                  value={formData.practitionerName}
                  onChange={(e) =>
                    setFormData((prev) => ({
                      ...prev,
                      practitionerName: e.target.value,
                    }))
                  }
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                  placeholder="e.g. Dr. Azman"
                />
              </div>

              {/* Clinic Contact (Optional) */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Clinic Contact (Phone/Website){" "}
                  <span className="text-muted-foreground font-normal">
                    (optional)
                  </span>
                </label>
                <input
                  type="text"
                  value={formData.clinicContact}
                  onChange={(e) =>
                    setFormData((prev) => ({
                      ...prev,
                      clinicContact: e.target.value,
                    }))
                  }
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                  placeholder="e.g. 03-9074 2020 or website URL"
                />
              </div>

              {/* Experience */}
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Your Experience{" "}
                  <span className="text-red-500">*</span>
                </label>
                <textarea
                  value={formData.experience}
                  onChange={(e) =>
                    setFormData((prev) => ({
                      ...prev,
                      experience: e.target.value,
                    }))
                  }
                  rows={5}
                  className="w-full px-3 py-2 border border-input bg-background rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-primary resize-none"
                  placeholder="Share your experience to help other reverts. Include details about the process, cost, recovery, and any tips..."
                  minLength={30}
                />
                <p className="text-xs text-muted-foreground mt-1">
                  Minimum 30 characters (currently: {formData.experience.length})
                </p>
              </div>

              {/* Submit Button */}
              <div className="flex gap-3 pt-4">
                <button
                  type="submit"
                  className="flex-1 bg-primary text-primary-foreground px-4 py-2 rounded-md hover:bg-primary/90 transition-colors"
                >
                  Submit for Review
                </button>
                <button
                  type="button"
                  onClick={() => setShowForm(false)}
                  className="px-4 py-2 border border-input bg-background rounded-md hover:bg-muted transition-colors"
                >
                  Cancel
                </button>
              </div>

              <p className="text-xs text-muted-foreground">
                By submitting, you agree to share your experience for community
                benefit. All submissions are moderated before publishing.
              </p>
            </form>
          )
        ) : (
          <div className="p-6 bg-surface-elevated rounded-xl border shadow-sm">
            <button
              onClick={() => setShowForm(true)}
              className="w-full bg-teal-700 text-white px-4 py-3.5 rounded-lg hover:bg-teal-800 transition-all font-semibold shadow-md hover:shadow-lg"
            >
              Share Your Experience
            </button>
          </div>
        )}
      </div>

      {/* Moderation Note */}
      <div className="mt-6 p-4 bg-amber-100 dark:bg-amber-900/30 border border-amber-300 dark:border-amber-700 rounded-lg shadow-sm">
        <div className="flex items-start gap-3">
          <svg className="w-5 h-5 text-amber-700 dark:text-amber-400 mt-0.5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
          </svg>
          <div>
            <h4 className="font-bold text-amber-900 dark:text-amber-100 text-sm mb-1">
              Moderation Policy
            </h4>
            <p className="text-sm text-amber-800 dark:text-amber-200">
              All submissions are reviewed before publishing to ensure authenticity and accuracy. Submissions typically appear within 2-3 business days.
            </p>
          </div>
        </div>
      </div>

      {/* Related Links */}
      <div className="mt-6 p-4 bg-muted rounded-lg">
        <h4 className="font-semibold text-foreground mb-3 text-sm">
          Related Resources
        </h4>
        <div className="flex flex-wrap gap-2">
          <a
            href="/panduan-rakyat/section-04/4.2-public-vs-private-healthcare"
            className="px-3 py-1.5 bg-background border border-input rounded text-sm text-primary hover:bg-primary/10 transition-colors"
          >
            4.2 Public vs Private Healthcare
          </a>
          <a
            href="/panduan-rakyat/section-04/4.3-government-hospitals"
            className="px-3 py-1.5 bg-background border border-input rounded text-sm text-primary hover:bg-primary/10 transition-colors"
          >
            4.3 Government Hospitals
          </a>
        </div>
      </div>
    </div>
  );
}
