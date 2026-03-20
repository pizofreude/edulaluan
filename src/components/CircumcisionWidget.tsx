import * as React from "react";
import { cn } from "@/lib/utils";

// Sample submissions data (to be replaced with backend data)
interface Submission {
  id: string;
  gender: "male" | "female";
  contributorName: string;
  isAnonymous: boolean;
  clinicName: string;
  location: string;
  method: string;
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
];

const femaleMethods = ["Needle prick only"];

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
    clinicName: "",
    location: "",
    practitionerName: "",
    clinicContact: "",
    experience: "",
  });

  const filteredSubmissions = React.useMemo(() => {
    if (filter === "all") return sampleSubmissions;
    return sampleSubmissions.filter((s) => s.gender === filter);
  }, [filter]);

  const handleSimulateLogin = () => {
    setIsLoggedIn(true);
    setShowForm(true);
  };

  const handleSubmit = (e: React.FormEvent) => {
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

    // Simulate submission (backend pending)
    console.log("Submitting:", formData);
    setFormSubmitted(true);
    setTimeout(() => {
      setShowForm(false);
      setFormSubmitted(false);
      setFormData({
        displayName: "",
        isAnonymous: false,
        gender: "" as "male" | "female",
        method: "",
        clinicName: "",
        location: "",
        practitionerName: "",
        clinicContact: "",
        experience: "",
      });
    }, 3000);
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
    }));
  };

  return (
    <div className={cn("w-full", className)}>
      {/* Filter Bar */}
      <div className="flex items-center justify-between mb-6 p-4 bg-muted rounded-xl">
        <div className="flex gap-2">
          <button
            onClick={() => setFilter("all")}
            className={cn(
              "px-4 py-2 rounded-lg text-sm font-semibold transition-all",
              filter === "all"
                ? "bg-primary text-primary-foreground"
                : "bg-background hover:bg-muted-foreground/10"
            )}
          >
            All
          </button>
          <button
            onClick={() => setFilter("male")}
            className={cn(
              "px-4 py-2 rounded-lg text-sm font-semibold transition-all",
              filter === "male"
                ? "bg-primary text-primary-foreground"
                : "bg-background hover:bg-muted-foreground/10"
            )}
          >
            Male (Sunat Lelaki)
          </button>
          <button
            onClick={() => setFilter("female")}
            className={cn(
              "px-4 py-2 rounded-lg text-sm font-semibold transition-all",
              filter === "female"
                ? "bg-primary text-primary-foreground"
                : "bg-background hover:bg-muted-foreground/10"
            )}
          >
            Female (Sunat Perempuan)
          </button>
        </div>
        <div className="px-3 py-1 bg-primary/10 text-primary rounded-full text-sm font-medium">
          {filteredSubmissions.length} submission
          {filteredSubmissions.length !== 1 ? "s" : ""}
        </div>
      </div>

      {/* Submissions List */}
      <div className="space-y-3 mb-8">
        {filteredSubmissions.map((submission) => (
          <div
            key={submission.id}
            className="border rounded-xl bg-surface-elevated overflow-hidden transition-all"
          >
            {/* Preview */}
            <div
              className="flex items-center justify-between p-4 cursor-pointer hover:bg-muted/50"
              onClick={() => toggleExpand(submission.id)}
            >
              <div className="flex items-center gap-3">
                <span
                  className={cn(
                    "px-2 py-1 rounded text-xs font-semibold",
                    submission.gender === "male"
                      ? "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200"
                      : "bg-pink-100 text-pink-800 dark:bg-pink-900 dark:text-pink-200"
                  )}
                >
                  {submission.gender === "male" ? "Male" : "Female"}
                </span>
                <span className="font-semibold text-foreground">
                  {submission.isAnonymous
                    ? "Anonymous"
                    : submission.contributorName}
                </span>
                <span className="text-muted-foreground">•</span>
                <span className="text-muted-foreground">
                  {submission.clinicName}
                </span>
                <span className="text-muted-foreground">
                  ({submission.location})
                </span>
              </div>
              <div className="flex items-center gap-3">
                <span className="px-2 py-1 bg-secondary text-secondary-foreground rounded text-xs">
                  {submission.method}
                </span>
                <svg
                  className={cn(
                    "w-5 h-5 text-muted-foreground transition-transform",
                    expandedId === submission.id && "rotate-180"
                  )}
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M19 9l-7 7-7-7"
                  />
                </svg>
              </div>
            </div>

            {/* Expanded Details */}
            {expandedId === submission.id && (
              <div className="border-t bg-muted/30 p-4 space-y-3">
                <div className="grid gap-3">
                  <div>
                    <span className="text-sm font-medium text-muted-foreground">
                      Clinic/Hospital:
                    </span>
                    <p className="text-foreground">{submission.clinicName}</p>
                  </div>
                  <div>
                    <span className="text-sm font-medium text-muted-foreground">
                      Location:
                    </span>
                    <p className="text-foreground">{submission.location}</p>
                  </div>
                  {submission.practitionerName && (
                    <div>
                      <span className="text-sm font-medium text-muted-foreground">
                        Practitioner:
                      </span>
                      <p className="text-foreground">
                        {submission.practitionerName}
                      </p>
                    </div>
                  )}
                  {submission.clinicContact && (
                    <div>
                      <span className="text-sm font-medium text-muted-foreground">
                        Contact:
                      </span>
                      <p className="text-foreground">
                        {submission.clinicContact}
                      </p>
                    </div>
                  )}
                  <div>
                    <span className="text-sm font-medium text-muted-foreground">
                      Method:
                    </span>
                    <p className="text-foreground">{submission.method}</p>
                  </div>
                  <div>
                    <span className="text-sm font-medium text-muted-foreground">
                      Experience:
                    </span>
                    <p className="text-foreground mt-1">
                      {submission.experience}
                    </p>
                  </div>
                  <div className="pt-2 border-t">
                    <span className="text-xs text-muted-foreground">
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
          <div className="p-6 bg-muted rounded-xl">
            <p className="text-sm text-muted-foreground mb-4">
              You need to be logged in to share your experience.
            </p>
            <button
              onClick={handleSimulateLogin}
              className="btn-primary inline-flex items-center gap-2"
            >
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1" />
              </svg>
              Login to Share
            </button>
          </div>
        ) : showForm ? (
          formSubmitted ? (
            <div className="p-6 bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800 rounded-xl">
              <div className="flex items-center gap-3 mb-3">
                <svg className="w-6 h-6 text-green-600 dark:text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
                <h4 className="font-semibold text-green-800 dark:text-green-200">
                  Submission Received!
                </h4>
              </div>
              <p className="text-sm text-green-700 dark:text-green-300">
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
          <div className="p-6 bg-muted rounded-xl">
            <button
              onClick={() => setShowForm(true)}
              className="w-full bg-primary text-primary-foreground px-4 py-3 rounded-lg hover:bg-primary/90 transition-colors font-semibold"
            >
              Share Your Experience
            </button>
          </div>
        )}
      </div>

      {/* Moderation Note */}
      <div className="mt-6 p-4 bg-amber-50 dark:bg-amber-900/20 border border-amber-200 dark:border-amber-800 rounded-lg">
        <div className="flex items-start gap-3">
          <svg className="w-5 h-5 text-amber-600 dark:text-amber-400 mt-0.5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
          </svg>
          <div>
            <h4 className="font-semibold text-amber-800 dark:text-amber-200 text-sm mb-1">
              Moderation Policy
            </h4>
            <p className="text-sm text-amber-700 dark:text-amber-300">
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
