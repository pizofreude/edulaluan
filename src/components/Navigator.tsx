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
                        : 'bg-surface-elevated border-border text-muted-foreground'
                  } ${isCurrent ? 'scale-110' : ''}`}
                  >
                    {isActive ? (
                      <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d={s.icon} />
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
                  
                  {/* Arrow indicator */}
                  <div className={`absolute bottom-6 right-6 transition-all duration-300 ${
                    incomeGroup === group ? 'text-primary opacity-100' : 'text-muted-foreground opacity-0 group-hover:opacity-50'
                  }`}>
                    <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
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
        <Card>
          <CardHeader>
            <CardTitle>What are you looking for?</CardTitle>
            <CardDescription>
              Select your primary educational goal.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {goals.map((g) => (
                <button
                  key={g}
                  onClick={() => {
                    setGoal(g);
                    handleNext();
                  }}
                  className={`p-6 border-2 rounded-lg text-left transition-all ${
                    goal === g
                      ? 'border-malaysia-teal bg-teal-50'
                      : 'border-gray-200 hover:border-malaysia-teal hover:bg-slate-50'
                  }`}
                >
                  <div className="font-semibold text-lg">{g}</div>
                </button>
              ))}
            </div>
            <div className="mt-6">
              <Button onClick={handleBack} variant="outline">
                Back
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Step 3: Results */}
      {step === 3 && (
        <div>
          <Card className="mb-6">
            <CardHeader>
              <CardTitle>Your Personalized Resources</CardTitle>
              <CardDescription>
                Found {filteredResources.length} resources for {incomeGroup === 'all' ? 'All Groups' : incomeGroup?.toUpperCase()} - {goal}
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="flex gap-2 mb-4">
                <Badge>{incomeGroup === 'all' ? 'All Groups' : incomeGroup?.toUpperCase()}</Badge>
                <Badge>{goal}</Badge>
              </div>
              <div className="flex gap-2">
                <Button onClick={handleBack} variant="outline">
                  Back
                </Button>
                <Button onClick={handleReset} variant="ghost">
                  Start Over
                </Button>
              </div>
            </CardContent>
          </Card>

          {filteredResources.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              {filteredResources.map((resource) => (
                <ResourceCard key={resource.id} resource={resource} />
              ))}
            </div>
          ) : (
            <Card>
              <CardContent className="py-12 text-center">
                <p className="text-muted-foreground mb-4">
                  No resources found for your selection. Try adjusting your criteria.
                </p>
                <Button onClick={handleReset}>Start Over</Button>
              </CardContent>
            </Card>
          )}
        </div>
      )}
    </div>
  );
};

export default Navigator;
