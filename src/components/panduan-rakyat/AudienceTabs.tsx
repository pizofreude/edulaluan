import React, { useState, useEffect } from 'react';

interface AudienceTabsProps {
  simpleContent: React.ReactNode;
  detailedContent: React.ReactNode;
  defaultTab?: 'simple' | 'detailed';
}

type TabType = 'simple' | 'detailed';

const AudienceTabs: React.FC<AudienceTabsProps> = ({
  simpleContent,
  detailedContent,
  defaultTab = 'detailed',
}) => {
  const [activeTab, setActiveTab] = useState<TabType>(defaultTab);

  // Persist tab choice in localStorage
  useEffect(() => {
    const savedTab = localStorage.getItem('panduan-rakyat-tab') as TabType | null;
    if (savedTab && (savedTab === 'simple' || savedTab === 'detailed')) {
      setActiveTab(savedTab);
    }
  }, []);

  const handleTabChange = (tab: TabType) => {
    setActiveTab(tab);
    localStorage.setItem('panduan-rakyat-tab', tab);
  };

  return (
    <div className="mb-8">
      {/* Tab Buttons */}
      <div className="mb-6 flex gap-2 rounded-xl bg-muted p-1.5">
        <button
          onClick={() => handleTabChange('simple')}
          className={`flex flex-1 items-center justify-center gap-2 rounded-lg px-4 py-3 text-sm font-semibold transition-all duration-200 ${
            activeTab === 'simple'
              ? 'bg-surface-elevated text-primary shadow-sm'
              : 'text-muted-foreground hover:text-foreground'
          }`}
          aria-pressed={activeTab === 'simple'}
        >
          <span className="text-xl">🧒</span>
          <span>Simple</span>
        </button>
        <button
          onClick={() => handleTabChange('detailed')}
          className={`flex flex-1 items-center justify-center gap-2 rounded-lg px-4 py-3 text-sm font-semibold transition-all duration-200 ${
            activeTab === 'detailed'
              ? 'bg-surface-elevated text-primary shadow-sm'
              : 'text-muted-foreground hover:text-foreground'
          }`}
          aria-pressed={activeTab === 'detailed'}
        >
          <span className="text-xl">🧑</span>
          <span>Detailed</span>
        </button>
      </div>

      {/* Tab Content */}
      <div
        className="transition-all duration-200"
        key={activeTab}
      >
        {activeTab === 'simple' ? simpleContent : detailedContent}
      </div>
    </div>
  );
};

export default AudienceTabs;
