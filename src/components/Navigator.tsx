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
        <p className="text-muted-foreground">Loading resources...</p>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto">
      {/* Progress Indicator */}
      <div className="mb-8">
        <div className="flex items-center justify-between mb-2">
          {[1, 2, 3].map((s) => (
            <div
              key={s}
              className={`flex items-center ${s < 3 ? 'flex-1' : ''}`}
            >
              <div
                className={`flex items-center justify-center w-10 h-10 rounded-full border-2 ${
                  s <= step
                    ? 'bg-malaysia-teal text-white border-malaysia-teal'
                    : 'bg-white text-gray-400 border-gray-300'
                }`}
              >
                {s}
              </div>
              {s < 3 && (
                <div
                  className={`flex-1 h-1 mx-2 ${
                    s < step ? 'bg-malaysia-teal' : 'bg-gray-300'
                  }`}
                />
              )}
            </div>
          ))}
        </div>
        <div className="flex justify-between text-sm text-muted-foreground">
          <span>Income Group</span>
          <span>Your Goal</span>
          <span>Results</span>
        </div>
      </div>

      {/* Step 1: Income Group */}
      {step === 1 && (
        <Card>
          <CardHeader>
            <CardTitle>What's your household income bracket?</CardTitle>
            <CardDescription>
              This helps us recommend the most relevant resources for you.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {incomeGroups.map((group) => (
                <button
                  key={group}
                  onClick={() => {
                    setIncomeGroup(group);
                    handleNext();
                  }}
                  className={`p-6 border-2 rounded-lg text-left transition-all ${
                    incomeGroup === group
                      ? 'border-malaysia-teal bg-teal-50'
                      : 'border-gray-200 hover:border-malaysia-teal hover:bg-slate-50'
                  }`}
                >
                  <div className="font-semibold text-lg mb-2">
                    {group === 'b40' && 'B40'}
                    {group === 'm40' && 'M40'}
                    {group === 't20' && 'T20'}
                    {group === 'all' && 'Not sure'}
                  </div>
                  <div className="text-sm text-muted-foreground">
                    {group === 'b40' && 'Household income below RM4,850'}
                    {group === 'm40' && 'Household income RM4,850 - RM10,970'}
                    {group === 't20' && 'Household income above RM10,970'}
                    {group === 'all' && "We'll show resources for everyone"}
                  </div>
                </button>
              ))}
            </div>
          </CardContent>
        </Card>
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
