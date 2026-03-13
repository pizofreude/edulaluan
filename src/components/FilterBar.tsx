import React, { useState } from 'react';
import { Input } from './ui/input';
import { Select } from './ui/select';
import { Button } from './ui/button';
import { Badge } from './ui/badge';

interface FilterBarProps {
  onFilterChange: (filters: Filters) => void;
  totalResults: number;
}

interface Filters {
  search: string;
  category: string;
  incomeGroup: string;
  cost: string;
  educationLevel: string;
}

const FilterBar: React.FC<FilterBarProps> = ({ onFilterChange, totalResults }) => {
  const [search, setSearch] = useState('');
  const [category, setCategory] = useState('all');
  const [incomeGroup, setIncomeGroup] = useState('all');
  const [cost, setCost] = useState('all');
  const [educationLevel, setEducationLevel] = useState('all');

  React.useEffect(() => {
    onFilterChange({
      search,
      category,
      incomeGroup,
      cost,
      educationLevel,
    });
  }, [search, category, incomeGroup, cost, educationLevel, onFilterChange]);

  const clearFilters = () => {
    setSearch('');
    setCategory('all');
    setIncomeGroup('all');
    setCost('all');
    setEducationLevel('all');
  };

  const hasActiveFilters = search || category !== 'all' || incomeGroup !== 'all' || cost !== 'all' || educationLevel !== 'all';

  return (
    <div className="bg-surface-elevated border border-border rounded-2xl p-6 md:p-8 mb-8 shadow-sm animate-fade-in">
      {/* Header with title and clear button */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="font-display text-xl md:text-2xl font-bold mb-1">
            Filter <span className="text-primary">Resources</span>
          </h2>
          <p className="text-sm text-muted-foreground">
            Find the perfect educational opportunities for your needs
          </p>
        </div>
        {hasActiveFilters && (
          <Button 
            onClick={clearFilters} 
            variant="outline" 
            size="sm"
            className="gap-2 hover:border-primary/50"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
            Clear All
          </Button>
        )}
      </div>

      {/* Filter grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-4 mb-6">
        {/* Search */}
        <div className="lg:col-span-2">
          <label htmlFor="search" className="block text-sm font-medium text-foreground mb-2">
            <svg className="w-4 h-4 inline mr-1.5 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
            Search
          </label>
          <Input
            id="search"
            type="text"
            placeholder="Search by name, description, or tags..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full"
          />
        </div>

        {/* Category */}
        <div>
          <label htmlFor="category" className="block text-sm font-medium text-foreground mb-2">
            <svg className="w-4 h-4 inline mr-1.5 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z" />
            </svg>
            Category
          </label>
          <Select
            id="category"
            value={category}
            onChange={(e) => setCategory(e.target.value)}
            className="w-full"
          >
            <option value="all">All Categories</option>
            <option value="scholarship">Scholarships</option>
            <option value="mooc">MOOCs</option>
            <option value="tvet">TVET</option>
            <option value="financial-aid">Financial Aid</option>
            <option value="digital-skills">Digital Skills</option>
            <option value="degree">Degree Programs</option>
            <option value="secondary-education">Secondary Education</option>
            <option value="elite-institutions">Elite Institutions</option>
            <option value="community">Community</option>
            <option value="other">Other</option>
          </Select>
        </div>

        {/* Income Group */}
        <div>
          <label htmlFor="income-group" className="block text-sm font-medium text-foreground mb-2">
            <svg className="w-4 h-4 inline mr-1.5 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
            </svg>
            Income Group
          </label>
          <Select
            id="income-group"
            value={incomeGroup}
            onChange={(e) => setIncomeGroup(e.target.value)}
            className="w-full"
          >
            <option value="all">All Groups</option>
            <option value="B40">B40</option>
            <option value="M40">M40</option>
            <option value="T20">T20</option>
          </Select>
        </div>

        {/* Cost */}
        <div>
          <label htmlFor="cost" className="block text-sm font-medium text-foreground mb-2">
            <svg className="w-4 h-4 inline mr-1.5 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            Cost
          </label>
          <Select
            id="cost"
            value={cost}
            onChange={(e) => setCost(e.target.value)}
            className="w-full"
          >
            <option value="all">All Costs</option>
            <option value="free">Free</option>
            <option value="subsidized">Subsidized</option>
            <option value="paid">Paid</option>
          </Select>
        </div>
      </div>

      {/* Education Level (full width on mobile) */}
      <div className="mb-6">
        <label htmlFor="education-level" className="block text-sm font-medium text-foreground mb-2">
          <svg className="w-4 h-4 inline mr-1.5 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path d="M12 14l9-5-9-5-9 5 9 5z" />
            <path d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
          </svg>
          Education Level
        </label>
        <Select
          id="education-level"
          value={educationLevel}
          onChange={(e) => setEducationLevel(e.target.value)}
          className="w-full md:w-1/2 lg:w-1/3"
        >
          <option value="all">All Levels</option>
          <option value="primary">Primary (Std 1-6)</option>
          <option value="secondary">Secondary (Form 1-5)</option>
          <option value="post-secondary">Post-Secondary (STPM/Diploma)</option>
          <option value="tertiary">Tertiary (Degree+)</option>
          <option value="all-levels">All Levels</option>
        </Select>
      </div>

      {/* Active filters with badges */}
      {hasActiveFilters && (
        <div className="flex flex-wrap items-center gap-2 mb-6 p-4 bg-primary/5 rounded-lg border border-primary/10">
          <span className="text-sm font-medium text-primary">Active filters:</span>
          {search && (
            <Badge variant="outline" className="gap-1.5 bg-white">
              <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
              "{search}"
            </Badge>
          )}
          {category !== 'all' && (
            <Badge variant="outline" className="gap-1.5 bg-white">
              <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z" />
              </svg>
              {category.replace('-', ' ')}
            </Badge>
          )}
          {incomeGroup !== 'all' && (
            <Badge variant="outline" className="gap-1.5 bg-white">
              <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
              </svg>
              {incomeGroup}
            </Badge>
          )}
          {cost !== 'all' && (
            <Badge variant="outline" className="gap-1.5 bg-white">
              <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              {cost}
            </Badge>
          )}
          {educationLevel !== 'all' && (
            <Badge variant="outline" className="gap-1.5 bg-white">
              <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path d="M12 14l9-5-9-5-9 5 9 5z" />
                <path d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
              </svg>
              {educationLevel.replace('-', ' ')}
            </Badge>
          )}
        </div>
      )}

      {/* Result count with decorative divider */}
      <div className="flex items-center gap-3 pt-4 border-t border-border">
        <div className="flex items-center justify-center w-8 h-8 rounded-full bg-primary/10 text-primary">
          <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
        </div>
        <p className="text-sm text-foreground">
          Showing <span className="font-bold text-primary">{totalResults}</span>{' '}
          resource{totalResults !== 1 ? 's' : ''}
          {hasActiveFilters && ' matching your criteria'}
        </p>
      </div>
    </div>
  );
};

export default FilterBar;
