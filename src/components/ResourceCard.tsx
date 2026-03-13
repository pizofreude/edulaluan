import React from 'react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle, CardFooter } from './ui/card';
import { Badge } from './ui/badge';
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

interface ResourceCardProps {
  resource: Resource;
}

const ResourceCard: React.FC<ResourceCardProps> = ({ resource }) => {
  const getCostColor = (cost: string) => {
    switch (cost) {
      case 'free':
        return 'bg-green-100 text-green-800 border-green-200';
      case 'subsidized':
        return 'bg-blue-100 text-blue-800 border-blue-200';
      case 'paid':
        return 'bg-amber-100 text-amber-800 border-amber-200';
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200';
    }
  };

  const getModeIcon = (mode: string) => {
    switch (mode) {
      case 'online':
        return '🌐';
      case 'in-person':
        return '🏫';
      case 'hybrid':
        return '🔄';
      default:
        return '📚';
    }
  };

  return (
    <Card className="h-full flex flex-col hover:shadow-lg transition-shadow">
      <CardHeader>
        <div className="flex items-start justify-between mb-2">
          <CardTitle className="text-xl">{resource.name}</CardTitle>
          {resource.is_featured && (
            <Badge className="bg-malaysia-gold text-white">Featured</Badge>
          )}
        </div>
        <CardDescription className="text-sm text-muted-foreground">
          by {resource.provider_name}
        </CardDescription>
      </CardHeader>
      <CardContent className="flex-grow">
        <p className="text-sm mb-4">{resource.description}</p>

        <div className="space-y-3">
          {/* Cost Badge */}
          <div className="flex items-center gap-2">
            <Badge className={getCostColor(resource.cost_type?.slug || 'paid')}>
              {(resource.cost_type?.name || 'Paid').charAt(0).toUpperCase() + (resource.cost_type?.name || 'Paid').slice(1)}
            </Badge>
            <Badge variant="outline" className="capitalize">
              {getModeIcon(resource.mode?.slug || 'in-person')} {resource.mode?.name || 'In-Person'}
            </Badge>
          </div>

          {/* Income Groups */}
          <div className="flex flex-wrap gap-2">
            {resource.income_groups.map((ig) => (
              <Badge key={ig.income_groups.slug} variant="secondary" className="text-xs">
                {ig.income_groups.name}
              </Badge>
            ))}
          </div>

          {/* Category */}
          <div>
            <Badge variant="outline" className="capitalize">
              {resource.category?.name || 'Other'}
            </Badge>
          </div>
        </div>
      </CardContent>
      <CardFooter>
        <a
          href={resource.url}
          target="_blank"
          rel="noopener noreferrer"
          className="w-full"
        >
          <Button className="w-full bg-malaysia-teal hover:bg-malaysia-teal-700">
            Visit Resource
            <svg
              className="ml-2 h-4 w-4"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"
              />
            </svg>
          </Button>
        </a>
      </CardFooter>
    </Card>
  );
};

export default ResourceCard;
