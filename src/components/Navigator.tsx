import React, { useState, useEffect } from 'react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from './ui/card';
import { Button } from './ui/button';
import { Badge } from './ui/badge';
import ResourceCard from './ResourceCard';

interface IncomeGroup {
  slug: string;
  name: string;
}

interface Resource {
  id: string;
  name: string;
  provider_name: string;
  description: string;
  url: string;
  category: { slug: string; name: string } | null;
  cost_type: { slug: string; name: string } | null;
  mode: { slug: string; name: string } | null;
  income_groups: Array<{ income_groups: IncomeGroup }>;
  education_levels: Array<{ education_levels: { slug: string; name: string } }>;
  languages: Array<{ languages: { code: string; name: string } }>;
  tags: Array<{ tags: { slug: string; name: string } }>;
}

interface NavigatorProps {
  initialResources?: Resource[];
}

type IncomeGroupType = 'b40' | 'm40' | 't20' | 'all';
type Goal = 'Scholarships' | 'Free Courses' | 'Skills Training' | 'Financial Aid' | 'Degree Programs' | 'Secondary Education' | 'Elite Institutions';

const Navigator: React.FC<NavigatorProps> = ({ initialResources = [] }) => {
  const [step, setStep] = useState(1);
  const [incomeGroup, setIncomeGroup] = useState<IncomeGroupType | null>(null);
  const [goal, setGoal] = useState<Goal | null>(null);
  const [resources, setResources] = useState<Resource[]>(initialResources);
  const [isLoading, setIsLoading] = useState(!initialResources);

  const incomeGroups: IncomeGroupType[] = ['b40', 'm40', 't20', 'all'];
  const goals: Goal[] = ['Scholarships', 'Free Courses', 'Skills Training', 'Financial Aid', 'Degree Programs', 'Secondary Education', 'Elite Institutions'];

  const categoryMap: Record<Goal, string[]> = {
    'Scholarships': ['scholarship'],
    'Free Courses': ['mooc'],
    'Skills Training': ['digital-skills', 'tvet'],
    'Financial Aid': ['financial-aid'],
    'Degree Programs': ['degree', 'mooc'],
    'Secondary Education': ['secondary-education'],
    'Elite Institutions': ['elite-institutions'],
  };

  // Fetch resources on mount if not provided
  useEffect(() => {
    if (!initialResources || initialResources.length === 0) {
      const fetchResources = async () => {
        try {
          const response = await fetch('/api/resources');
          const result = await response.json();
          if (result.data) {
            setResources(result.data);
          }
        } catch (error) {
          console.error('Failed to fetch resources:', error);
        } finally {
          setIsLoading(false);
        }
      };
      fetchResources();
    } else {
      setIsLoading(false);
    }
  }, [initialResources]);

  const filteredResources = resources.filter((resource) => {
    if (!incomeGroup || !goal) return false;

    // Filter by category
    const categories = categoryMap[goal];
    if (!resource.category || !categories.includes(resource.category.slug)) return false;

    // Filter by income group (if not "all")
    if (incomeGroup !== 'all') {
      const hasIncomeGroup = resource.income_groups.some(
        ig => ig.income_groups.slug === incomeGroup
      );
      if (!hasIncomeGroup) return false;
    }

    return true;
  });

  const handleBack = () => {
    if (step > 1) setStep(step - 1);
  };

  const handleNext = () => {
    if (step < 3) setStep(step + 1);
  };

  const handleReset = () => {
    setStep(1);
    setIncomeGroup(null);
    setGoal(null);
  };

  if (isLoading) {
    return (
      <div className="max-w-4xl mx-auto text-center py-12">
        <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-primary/10 text-primary mb-4 animate-pulse">
          <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
          </svg>
        </div>
        <p className="text-foreground font-medium">Loading resources...</p>
        <p className="text-sm text-muted-foreground mt-2">Finding the best opportunities for you</p>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto">
      {/* Progress Indicator - Journey Path Design */}
      <div className="mb-12 animate-fade-in">
        <div className="relative">
          {/* Connection line (background) */}
          <div className="absolute top-5 left-0 right-0 h-0.5 bg-border" aria-hidden="true"></div>
          
          {/* Progress line (active) */}
          <div 
            className="absolute top-5 left-0 h-0.5 bg-primary transition-all duration-500 ease-out"
            style={{ width: step === 1 ? '0%' : step === 2 ? '50%' : '100%' }}
            aria-hidden="true"
          ></div>

          {/* Step nodes */}
          <div className="relative flex items-center justify-between">
            {[
              { num: 1, label: 'Income Group', icon: 'M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z' },
              { num: 2, label: 'Your Goal', icon: 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4' },
              { num: 3, label: 'Results', icon: 'M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z' }
            ].map((s, index) => {
              const isActive = s.num <= step;
              const isCurrent = s.num === step;
              return (
                <div key={s.num} className="flex flex-col items-center flex-1">
                  <div
                    className={`w-10 h-10 rounded-full flex items-center justify-center border-2 transition-all duration-500 ${
                      isActive
                        ? 'bg-primary border-primary text-white shadow-lg shadow-primary/30'
                        : 'bg-background border-primary text-primary'
                  } ${isCurrent ? 'scale-110' : ''}`}
                  >
                    {isActive ? (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2" aria-hidden="true">
                        <path strokeLinecap="round" strokeLinejoin="round" d={s.icon} />
                      </svg>
                    ) : (
                      <span className="text-sm font-medium">{s.num}</span>
                    )}
                  </div>
                  <span className={`text-xs mt-3 font-medium transition-colors duration-300 ${
                    isActive ? 'text-primary' : 'text-muted-foreground'
                  }`}>
                    {s.label}
                  </span>
                </div>
              );
            })}
          </div>
        </div>
      </div>

      {/* Step 1: Income Group */}
      {step === 1 && (
        <div className="animate-fade-in-up">
          <div className="text-center mb-8">
            <h3 className="font-display text-2xl md:text-3xl font-bold mb-3">
              What's your <span className="text-primary">household income</span> bracket?
            </h3>
            <p className="text-muted-foreground text-base md:text-lg">
              This helps us recommend the most relevant resources for your situation.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
            {incomeGroups.map((group, index) => (
              <button
                key={group}
                onClick={() => {
                  setIncomeGroup(group);
                  handleNext();
                }}
                className={`group relative p-6 md:p-8 rounded-2xl border-2 text-left transition-all duration-300 hover:shadow-xl animate-fade-in-up ${
                  incomeGroup === group
                    ? 'border-primary bg-primary/5 shadow-lg'
                    : 'border-border bg-surface-elevated hover:border-primary/50'
                }`}
                style={{ animationDelay: `${index * 75}ms` }}
              >
                {/* Batik accent corner */}
                <div className="absolute top-0 right-0 w-12 h-12 opacity-[0.03] text-primary" aria-hidden="true">
                  <svg viewBox="0 0 100 100" fill="currentColor">
                    <path d="M50 0 L100 50 L50 100 L0 50 Z" />
                  </svg>
                </div>
                
                <div className="relative">
                  <div className="flex items-center gap-3 mb-3">
                    <div className={`w-10 h-10 rounded-full flex items-center justify-center ${
                      incomeGroup === group ? 'bg-primary text-white' : 'bg-primary/10 text-primary'
                    }`}>
                      {group === 'b40' && (
                        <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                        </svg>
                      )}
                      {group === 'm40' && (
                        <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                        </svg>
                      )}
                      {group === 't20' && (
                        <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z" />
                        </svg>
                      )}
                      {group === 'all' && (
                        <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                        </svg>
                      )}
                    </div>
                    <div className={`text-xl md:text-2xl font-display font-bold ${
                      incomeGroup === group ? 'text-primary' : 'text-foreground'
                    }`}>
                      {group === 'b40' && 'B40'}
                      {group === 'm40' && 'M40'}
                      {group === 't20' && 'T20'}
                      {group === 'all' && 'Not sure'}
                    </div>
                  </div>
                  
                  <p className={`text-sm md:text-base leading-relaxed ${
                    incomeGroup === group ? 'text-foreground' : 'text-muted-foreground'
                  }`}>
                    {group === 'b40' && 'Household income below RM4,850 per month'}
                    {group === 'm40' && 'Household income RM4,850 - RM10,970 per month'}
                    {group === 't20' && 'Household income above RM10,970 per month'}
                    {group === 'all' && "We'll show resources for all income groups"}
                  </p>

                  {/* Arrow indicator - centered vertically on right side */}
                  <div className={`absolute right-6 top-1/2 -translate-y-1/2 transition-all duration-300 ${
                    incomeGroup === group ? 'text-primary opacity-100 scale-110' : 'text-muted-foreground opacity-0 group-hover:opacity-50'
                  }`}>
                    <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 5l7 7-7 7" />
                    </svg>
                  </div>
                </div>
              </button>
            ))}
          </div>
          
          <p className="text-center text-xs text-muted-foreground">
            Click to select your income group and continue
          </p>
        </div>
      )}

      {/* Step 2: Goal */}
      {step === 2 && (
        <div className="animate-fade-in-up">
          <div className="text-center mb-8">
            <h3 className="font-display text-2xl md:text-3xl font-bold mb-3">
              What are you <span className="text-primary">looking for?</span>
            </h3>
            <p className="text-muted-foreground text-base md:text-lg">
              Select your primary educational goal to find matching resources.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
            {goals.map((g, index) => (
              <button
                key={g}
                onClick={() => {
                  setGoal(g);
                  handleNext();
                }}
                className={`group relative p-6 md:p-8 rounded-2xl border-2 text-left transition-all duration-300 hover:shadow-xl animate-fade-in-up ${
                  goal === g
                    ? 'border-primary bg-primary/5 shadow-lg'
                    : 'border-border bg-surface-elevated hover:border-primary/50'
                }`}
                style={{ animationDelay: `${index * 50}ms` }}
              >
                {/* Batik accent corner */}
                <div className="absolute top-0 right-0 w-12 h-12 opacity-[0.03] text-primary" aria-hidden="true">
                  <svg viewBox="0 0 100 100" fill="currentColor">
                    <path d="M50 0 L100 50 L50 100 L0 50 Z" />
                  </svg>
                </div>
                
                <div className="relative flex items-center gap-3">
                  <div className={`w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0 ${
                    goal === g ? 'bg-primary text-white' : 'bg-primary/10 text-primary'
                  }`}>
                    {g === 'Scholarships' && (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                      </svg>
                    )}
                    {g === 'Free Courses' && (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                      </svg>
                    )}
                    {g === 'Skills Training' && (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z" />
                      </svg>
                    )}
                    {g === 'Financial Aid' && (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>
                    )}
                    {g === 'Degree Programs' && (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path d="M12 14l9-5-9-5-9 5 9 5z" />
                        <path d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                      </svg>
                    )}
                    {g === 'Secondary Education' && (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                      </svg>
                    )}
                    {g === 'Elite Institutions' && (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z" />
                      </svg>
                    )}
                  </div>
                  <div className={`text-lg md:text-xl font-semibold ${
                    goal === g ? 'text-primary' : 'text-foreground'
                  }`}>
                    {g}
                  </div>
                </div>
                
                {/* Arrow indicator */}
                <div className={`absolute bottom-6 right-6 transition-all duration-300 ${
                  goal === g ? 'text-primary opacity-100' : 'text-muted-foreground opacity-0 group-hover:opacity-50'
                }`}>
                  <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </button>
            ))}
          </div>
          
          <div className="flex items-center justify-between">
            <p className="text-xs text-muted-foreground">
              Click to select your goal and continue
            </p>
            <Button onClick={handleBack} variant="outline" className="gap-2">
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 19l-7-7 7-7" />
              </svg>
              Back
            </Button>
          </div>
        </div>
      )}

      {/* Step 3: Results */}
      {step === 3 && (
        <div className="animate-fade-in-up">
          {/* Results header card */}
          <div className="bg-surface-elevated rounded-2xl border border-border p-6 md:p-8 mb-8 shadow-sm">
            <div className="flex items-start justify-between flex-wrap gap-4">
              <div>
                <h3 className="font-display text-xl md:text-2xl font-bold mb-2">
                  Your Personalized Resources
                </h3>
                <p className="text-muted-foreground">
                  Found <span className="text-primary font-semibold">{filteredResources.length}</span> resources for{' '}
                  <span className="text-primary font-semibold">{incomeGroup === 'all' ? 'All Groups' : incomeGroup?.toUpperCase()}</span> —{' '}
                  <span className="text-primary font-semibold">{goal}</span>
                </p>
              </div>
              <div className="flex items-center gap-2">
                <Badge variant="outline" className="px-3 py-1.5 text-sm">
                  <svg className="w-4 h-4 mr-1.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                  {incomeGroup === 'all' ? 'All Groups' : incomeGroup?.toUpperCase()}
                </Badge>
                <Badge variant="outline" className="px-3 py-1.5 text-sm">
                  <svg className="w-4 h-4 mr-1.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                  </svg>
                  {goal}
                </Badge>
              </div>
            </div>
            
            <div className="flex flex-wrap gap-3 mt-6 pt-6 border-t border-border">
              <Button onClick={handleBack} variant="outline" className="gap-2">
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 19l-7-7 7-7" />
                </svg>
                Back
              </Button>
              <Button onClick={handleReset} variant="ghost" className="gap-2">
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                </svg>
                Start Over
              </Button>
            </div>
          </div>

          {/* Results grid */}
          {filteredResources.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              {filteredResources.map((resource, index) => (
                <div key={resource.id} className="animate-fade-in-up" style={{ animationDelay: `${index * 50}ms` }}>
                  <ResourceCard resource={resource} />
                </div>
              ))}
            </div>
          ) : (
            <div className="text-center py-16 bg-surface-elevated rounded-2xl border border-border">
              <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-amber-100 text-amber-600 mb-4">
                <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                </svg>
              </div>
              <h4 className="font-display text-xl font-bold mb-2">No resources found</h4>
              <p className="text-muted-foreground mb-6 max-w-md mx-auto">
                We couldn't find resources matching your current selection. Try adjusting your criteria or browse all resources instead.
              </p>
              <Button onClick={handleReset} className="gap-2">
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                </svg>
                Start Over
              </Button>
            </div>
          )}
        </div>
      )}
    </div>
  );
};

export default Navigator;
