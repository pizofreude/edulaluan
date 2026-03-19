import React, { useState } from 'react';

interface FAQItem {
  question: string;
  answer: React.ReactNode;
}

interface FAQAccordionProps {
  faqs: FAQItem[];
  title?: string;
}

const FAQAccordion: React.FC<FAQAccordionProps> = ({
  faqs,
  title = 'Frequently Asked Questions',
}) => {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  const toggleOpen = (index: number) => {
    setOpenIndex(openIndex === index ? null : index);
  };

  return (
    <section className="mt-12">
      <h2 className="mb-6 font-display text-2xl font-bold text-foreground">
        {title}
      </h2>
      <div className="space-y-3">
        {faqs.map((faq, index) => (
          <div
            key={index}
            className="overflow-hidden rounded-xl border bg-surface-elevated transition-all"
          >
            <button
              onClick={() => toggleOpen(index)}
              className="flex w-full items-center justify-between px-5 py-4 text-left transition-colors hover:bg-muted/50"
              aria-expanded={openIndex === index}
            >
              <span className="pr-4 font-semibold text-foreground">
                {faq.question}
              </span>
              <svg
                className={`h-5 w-5 shrink-0 text-muted-foreground transition-transform ${
                  openIndex === index ? 'rotate-180' : ''
                }`}
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M19 9l-7 7-7-7"
                />
              </svg>
            </button>
            <div
              className={`overflow-hidden transition-all duration-300 ${
                openIndex === index ? 'max-h-[1000px] opacity-100' : 'max-h-0 opacity-0'
              }`}
            >
              <div className="border-t px-5 py-4 text-muted-foreground">
                <div className="prose-panduan text-sm">{faq.answer}</div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
};

export default FAQAccordion;
