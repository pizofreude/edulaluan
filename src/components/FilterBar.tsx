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
    <div className="bg-white border rounded-lg p-6 mb-6">
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-lg font-semibold">Filter Resources</h2>
        {hasActiveFilters && (
          <Button onClick={clearFilters} variant="ghost" size="sm">
            Clear All
          </Button>
        )}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-4 mb-4">
        {/* Search */}
        <div>
          <label htmlFor="search" className="block text-sm font-medium mb-2">
            Search
          </label>
          <Input
            id="search"
            type="text"
            placeholder="Search resources..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </div>

        {/* Category */}
        <div>
          <label htmlFor="category" className="block text-sm font-medium mb-2">
            Category
          </label>
          <Select
            id="category"
            value={category}
            onChange={(e) => setCategory(e.target.value)}
          >
            <option value="all">All Categories</option>
            <option value="scholarship">Scholarships</option>
            <option value="mooc">MOOCs</option>
            <option value="tvet">TVET</option>
            <option value="financial-aid">Financial Aid</option>
            <option value="digital-skills">Digital Skills</option>
            <option value="degree">Degree Programs</option>
            <option value="secondary-education">Secondary Education (SBP)</option>
            <option value="elite-institutions">Elite Institutions</option>
            <option value="community">Community</option>
            <option value="other">Other</option>
          </Select>
        </div>

        {/* Income Group */}
        <div>
          <label htmlFor="income-group" className="block text-sm font-medium mb-2">
            Income Group
          </label>
          <Select
            id="income-group"
            value={incomeGroup}
            onChange={(e) => setIncomeGroup(e.target.value)}
          >
            <option value="all">All Groups</option>
            <option value="B40">B40</option>
            <option value="M40">M40</option>
            <option value="T20">T20</option>
          </Select>
        </div>

        {/* Cost */}
        <div>
          <label htmlFor="cost" className="block text-sm font-medium mb-2">
            Cost
          </label>
          <Select
            id="cost"
            value={cost}
            onChange={(e) => setCost(e.target.value)}
          >
            <option value="all">All Costs</option>
            <option value="free">Free</option>
            <option value="subsidized">Subsidized</option>
            <option value="paid">Paid</option>
          </Select>
        </div>

        {/* Education Level */}
        <div>
          <label htmlFor="education-level" className="block text-sm font-medium mb-2">
            Education Level
          </label>
          <Select
            id="education-level"
            value={educationLevel}
            onChange={(e) => setEducationLevel(e.target.value)}
          >
            <option value="all">All Levels</option>
            <option value="primary">Primary (Std 1-6)</option>
            <option value="secondary">Secondary (Form 1-5)</option>
            <option value="post-secondary">Post-Secondary (STPM/Diploma)</option>
            <option value="tertiary">Tertiary (Degree+)</option>
            <option value="all-levels">All Levels</option>
          </Select>
        </div>
      </div>

      {/* Active filters */}
      {hasActiveFilters && (
        <div className="flex items-center gap-2 flex-wrap">
          <span className="text-sm text-muted-foreground">Active filters:</span>
          {search && (
            <Badge variant="secondary">
              Search: "{search}"
            </Badge>
          )}
          {category !== 'all' && (
            <Badge variant="secondary">
              Category: {category}
            </Badge>
          )}
          {incomeGroup !== 'all' && (
            <Badge variant="secondary">
              Income: {incomeGroup}
            </Badge>
          )}
          {cost !== 'all' && (
            <Badge variant="secondary">
              Cost: {cost}
            </Badge>
          )}
        </div>
      )}

      {/* Result count */}
      <div className="mt-4 pt-4 border-t">
        <p className="text-sm text-muted-foreground">
          Showing <span className="font-semibold text-foreground">{totalResults}</span> resource{totalResults !== 1 ? 's' : ''}
        </p>
      </div>
    </div>
  );
};

export default FilterBar;
