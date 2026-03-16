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
        return 'bg-green-500 text-white border-green-600 hover:bg-green-600';
      case 'subsidized':
        return 'bg-blue-500 text-white border-blue-600 hover:bg-blue-600';
      case 'paid':
        return 'bg-amber-500 text-white border-amber-600 hover:bg-amber-600';
      default:
        return 'bg-gray-500 text-white border-gray-600 hover:bg-gray-600';
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
    <Card className="group relative h-full flex flex-col bg-surface border-border hover:shadow-xl hover:shadow-primary/10 transition-all duration-300 overflow-hidden">
      {/* Batik accent corner (top right) */}
      <div className="absolute top-0 right-0 w-16 h-16 opacity-[0.03] text-[#0d9488] pointer-events-none" aria-hidden="true">
        <svg viewBox="0 0 100 100" fill="currentColor">
          <path d="M50 0 L100 50 L50 100 L0 50 Z" />
        </svg>
      </div>

      {/* Featured ribbon */}
      {resource.is_featured && (
        <div className="absolute top-0 left-0 bg-gradient-to-r from-[#f59e0b] to-[#d97706] text-white text-xs font-bold px-3 py-1.5 rounded-br-lg z-10">
          <span className="flex items-center gap-1">
            <svg className="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
            </svg>
            Featured
          </span>
        </div>
      )}

      <CardHeader className="pb-3">
        {/* Category pill */}
        <div className="mb-3">
          <Badge variant="outline" className="bg-primary/10 text-primary border-primary/20 text-xs font-semibold uppercase tracking-wide">
            {resource.category?.name || 'Resource'}
          </Badge>
        </div>

        {/* Title with hover effect */}
        <CardTitle className="text-xl font-display font-bold text-foreground group-hover:text-primary transition-colors duration-300 leading-tight">
          {resource.name}
        </CardTitle>

        {/* Provider */}
        <CardDescription className="text-sm text-muted-foreground font-medium">
          by {resource.provider_name}
        </CardDescription>
      </CardHeader>

      <CardContent className="flex-grow space-y-4">
        {/* Description with line clamp */}
        <p className="text-sm text-foreground/80 leading-relaxed line-clamp-3">
          {resource.description}
        </p>

        {/* Badges grid */}
        <div className="space-y-3">
          {/* Cost & Mode row */}
          <div className="flex flex-wrap items-center gap-2">
            <Badge className={`text-xs font-semibold border ${getCostColor(resource.cost_type?.slug || 'paid')}`}>
              {(resource.cost_type?.name || 'Paid').charAt(0).toUpperCase() + (resource.cost_type?.name || 'Paid').slice(1)}
            </Badge>
            <Badge variant="outline" className="text-xs bg-muted border-border text-foreground">
              <span className="mr-1">{getModeIcon(resource.mode?.slug || 'in-person')}</span>
              {resource.mode?.name || 'In-Person'}
            </Badge>
          </div>

          {/* Income Groups */}
          <div className="flex flex-wrap gap-1.5">
            {resource.income_groups.slice(0, 3).map((ig) => (
              <Badge key={ig.income_groups.slug} variant="secondary" className="text-xs bg-muted text-foreground hover:bg-muted/80 transition-colors">
                {ig.income_groups.name}
              </Badge>
            ))}
          </div>

          {/* Education levels (if available) */}
          {resource.education_levels && resource.education_levels.length > 0 && (
            <div className="flex flex-wrap gap-1.5">
              {resource.education_levels.slice(0, 2).map((el) => (
                <Badge key={el.education_levels.slug} variant="outline" className="text-xs bg-primary/5 text-primary border-primary/20">
                  {el.education_levels.name}
                </Badge>
              ))}
            </div>
          )}
        </div>
      </CardContent>

      <CardFooter className="pt-4 border-t border-border">
        <a
          href={resource.url}
          target="_blank"
          rel="noopener noreferrer"
          className="w-full group/btn"
        >
          <Button className="w-full bg-gradient-to-r from-[#0d9488] to-[#0f766e] hover:from-[#0f766e] hover:to-[#0d9488] text-white font-semibold shadow-md hover:shadow-lg transition-all duration-300 group-hover/btn:scale-[1.02]">
            Visit Resource
            <svg
              className="ml-2 h-4 w-4 transition-transform group-hover/btn:translate-x-1"
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

      {/* Bottom accent line (appears on hover) */}
      <div className="absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-[#0d9488] via-[#2dd4bf] to-[#f59e0b] opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
    </Card>
  );
};

export default ResourceCard;
