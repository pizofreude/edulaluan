import React, { useState, useEffect } from 'react';
import FilterBar from './FilterBar';
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
      <div className="text-center py-12">
        <p className="text-muted-foreground">Loading resources...</p>
      </div>
    );
  }

  return (
    <>
      <FilterBar onFilterChange={handleFilterChange} totalResults={filteredResources.length} />

      {filteredResources.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredResources.map((resource) => (
            <ResourceCard key={resource.id} resource={resource} />
          ))}
        </div>
      ) : (
        <div className="text-center py-12">
          <p className="text-lg text-muted-foreground mb-4">
            No resources found matching your criteria.
          </p>
          <p className="text-sm text-muted-foreground">
            Try adjusting your filters to see more results.
          </p>
        </div>
      )}
    </>
  );
};

export default ResourcesPage;
