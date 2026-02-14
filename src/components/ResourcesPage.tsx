import React, { useState } from 'react';
import FilterBar from './FilterBar';
import ResourceCard from './ResourceCard';

interface Resource {
  id: string;
  data: {
    name: string;
    provider: string;
    description: string;
    url: string;
    category: string;
    incomeGroups: string[];
    cost: string;
    mode: string;
    language: string[];
    tags: string[];
    featured: boolean;
  };
}

interface ResourcesPageProps {
  resources: Resource[];
}

const ResourcesPage: React.FC<ResourcesPageProps> = ({ resources }) => {
  const [filteredResources, setFilteredResources] = useState(resources);

  const handleFilterChange = (filters: { search: string; category: string; incomeGroup: string; cost: string }) => {
    let filtered = [...resources];

    // Search filter
    if (filters.search) {
      const searchLower = filters.search.toLowerCase();
      filtered = filtered.filter(r =>
        r.data.name.toLowerCase().includes(searchLower) ||
        r.data.description.toLowerCase().includes(searchLower) ||
        r.data.provider.toLowerCase().includes(searchLower) ||
        r.data.tags.some(tag => tag.toLowerCase().includes(searchLower))
      );
    }

    // Category filter
    if (filters.category !== 'all') {
      filtered = filtered.filter(r => r.data.category === filters.category);
    }

    // Income group filter
    if (filters.incomeGroup !== 'all') {
      filtered = filtered.filter(r => r.data.incomeGroups.includes(filters.incomeGroup));
    }

    // Cost filter
    if (filters.cost !== 'all') {
      filtered = filtered.filter(r => r.data.cost === filters.cost);
    }

    setFilteredResources(filtered);
  };

  return (
    <>
      <FilterBar onFilterChange={handleFilterChange} totalResults={filteredResources.length} />
      
      {filteredResources.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredResources.map((resource) => (
            <ResourceCard key={resource.id} resource={resource.data} />
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
