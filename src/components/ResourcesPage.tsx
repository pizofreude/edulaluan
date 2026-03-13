import React, { useState, useEffect } from 'react';
import FilterBar from './FilterBar';
import ResourceCard from './ResourceCard';
import { Button } from './ui/button';

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
  is_featured?: boolean;
}

interface ResourcesPageProps {
  // No props needed - component fetches its own data
}

const ResourcesPage: React.FC<ResourcesPageProps> = () => {
  const [resources, setResources] = useState<Resource[]>([]);
  const [filteredResources, setFilteredResources] = useState<Resource[]>([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const fetchResources = async () => {
      try {
        const response = await fetch('/api/resources');
        const result = await response.json();
        if (result.data) {
          setResources(result.data);
          setFilteredResources(result.data);
        }
      } catch (error) {
        console.error('Failed to fetch resources:', error);
      } finally {
        setIsLoading(false);
      }
    };
    fetchResources();
  }, []);

  const handleFilterChange = (filters: { search: string; category: string; incomeGroup: string; cost: string; educationLevel: string }) => {
    let filtered = [...resources];

    // Search filter
    if (filters.search) {
      const searchLower = filters.search.toLowerCase();
      filtered = filtered.filter(r =>
        r.name.toLowerCase().includes(searchLower) ||
        r.description.toLowerCase().includes(searchLower) ||
        r.provider_name.toLowerCase().includes(searchLower) ||
        r.tags.some(t => t.tags.slug.toLowerCase().includes(searchLower))
      );
    }

    // Category filter
    if (filters.category !== 'all' && filters.category) {
      filtered = filtered.filter(r => r.category?.slug === filters.category);
    }

    // Income group filter
    if (filters.incomeGroup !== 'all' && filters.incomeGroup) {
      filtered = filtered.filter(r =>
        r.income_groups.some(ig => ig.income_groups.slug === filters.incomeGroup)
      );
    }

    // Cost filter
    if (filters.cost !== 'all' && filters.cost) {
      filtered = filtered.filter(r => r.cost_type?.slug === filters.cost);
    }

    // Education level filter
    if (filters.educationLevel !== 'all' && filters.educationLevel) {
      filtered = filtered.filter(r =>
        r.education_levels.some(el => el.education_levels.slug === filters.educationLevel)
      );
    }

    setFilteredResources(filtered);
  };

  if (isLoading) {
    return (
      <div className="text-center py-16 animate-fade-in">
        <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-primary/10 text-primary mb-4 animate-pulse">
          <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
          </svg>
        </div>
        <p className="text-foreground font-medium text-lg">Loading resources...</p>
        <p className="text-sm text-muted-foreground mt-2">Finding the best educational opportunities for you</p>
      </div>
    );
  }

  return (
    <>
      <FilterBar onFilterChange={handleFilterChange} totalResults={filteredResources.length} />

      {filteredResources.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredResources.map((resource, index) => (
            <div key={resource.id} className="animate-fade-in-up" style={{ animationDelay: `${index * 50}ms` }}>
              <ResourceCard resource={resource} />
            </div>
          ))}
        </div>
      ) : (
        <div className="text-center py-16 bg-surface-elevated rounded-2xl border border-border animate-fade-in">
          <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-amber-100 text-amber-600 mb-4">
            <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </div>
          <h3 className="font-display text-xl font-bold mb-2">No resources found</h3>
          <p className="text-muted-foreground mb-6 max-w-md mx-auto">
            We couldn't find resources matching your current filters. Try adjusting your search criteria or clearing all filters to see more results.
          </p>
          <div className="flex items-center justify-center gap-3">
            <Button onClick={() => handleFilterChange({ search: '', category: 'all', incomeGroup: 'all', cost: 'all', educationLevel: 'all' })} variant="outline" className="gap-2">
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
              Clear All Filters
            </Button>
            <a href="/navigate" className="inline-flex items-center gap-2 px-4 py-2 bg-primary hover:bg-primary-dark text-primary-foreground font-semibold rounded-lg transition-colors">
              Try Navigator
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
              </svg>
            </a>
          </div>
        </div>
      )}
    </>
  );
};

export default ResourcesPage;
