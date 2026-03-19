import React, { useState, useCallback } from 'react';
import { Button } from '../ui/button';

interface WizardStep {
  id: string;
  question: string;
  paths: WizardPath[];
}

interface WizardPath {
  label: string;
  nextStepId?: string;
  content?: React.ReactNode;
  isFinal?: boolean;
}

interface WizardModalProps {
  isOpen: boolean;
  onClose: () => void;
  title: string;
  steps: WizardStep[];
  initialStepId: string;
}

const WizardModal: React.FC<WizardModalProps> = ({
  isOpen,
  onClose,
  title,
  steps,
  initialStepId,
}) => {
  const [currentStepId, setCurrentStepId] = useState<string>(initialStepId);
  const [history, setHistory] = useState<string[]>([]);

  const currentStep = steps.find((s) => s.id === currentStepId);

  const handlePathClick = useCallback(
    (path: WizardPath) => {
      if (path.isFinal || !path.nextStepId) {
        // Show final content, don't change step
        return;
      }
      setHistory([...history, currentStepId]);
      setCurrentStepId(path.nextStepId);
    },
    [history, currentStepId]
  );

  const handleBack = useCallback(() => {
    if (history.length > 0) {
      const previousStepId = history[history.length - 1];
      setHistory(history.slice(0, -1));
      setCurrentStepId(previousStepId);
    }
  }, [history]);

  const handleReset = useCallback(() => {
    setHistory([]);
    setCurrentStepId(initialStepId);
  }, [initialStepId]);

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      onClose();
      handleReset();
    }
  };

  if (!isOpen || !currentStep) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4 backdrop-blur-sm"
      onClick={handleBackdropClick}
      role="dialog"
      aria-modal="true"
      aria-labelledby="wizard-title"
    >
      <div className="max-h-[90vh] w-full max-w-2xl overflow-hidden rounded-2xl bg-surface-elevated shadow-2xl">
        {/* Header */}
        <div className="border-b bg-gradient-to-r from-[#0d9488] to-[#0f766e] p-6">
          <div className="flex items-center justify-between">
            <h2 id="wizard-title" className="text-xl font-bold text-white">
              {title}
            </h2>
            <button
              onClick={() => {
                onClose();
                handleReset();
              }}
              className="rounded-full p-2 text-white/80 transition-colors hover:bg-white/20 hover:text-white"
              aria-label="Close wizard"
            >
              <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          {/* Progress indicator */}
          {history.length > 0 && (
            <div className="mt-3 flex items-center gap-2 text-sm text-white/80">
              <span>Step {history.length + 1}</span>
              <div className="h-px w-8 bg-white/30" />
              <button
                onClick={handleReset}
                className="text-white underline hover:text-white/90"
              >
                Start over
              </button>
            </div>
          )}
        </div>

        {/* Content */}
        <div className="max-h-[60vh] overflow-y-auto p-6">
          {/* Question */}
          <h3 className="mb-6 text-lg font-semibold text-foreground">
            {currentStep.question}
          </h3>

          {/* Paths */}
          <div className="space-y-3">
            {currentStep.paths.map((path, index) => (
              <div key={index}>
                {path.isFinal && path.content ? (
                  // Final content display
                  <div className="rounded-xl border-2 border-[#0d9488] bg-[#f5f9f7] p-6">
                    <div className="prose-panduan">{path.content}</div>
                    <div className="mt-6 flex gap-3">
                      <Button
                        onClick={handleReset}
                        variant="outline"
                        className="border-[#0d9488] text-[#0d9488] hover:bg-[#0d9488] hover:text-white"
                      >
                        Start Over
                      </Button>
                      <Button
                        onClick={() => {
                          onClose();
                          handleReset();
                        }}
                        className="bg-[#0d9488] text-white hover:bg-[#0f766e]"
                      >
                        Close
                      </Button>
                    </div>
                  </div>
                ) : (
                  // Clickable path button
                  <button
                    onClick={() => handlePathClick(path)}
                    className="flex w-full items-center justify-between rounded-xl border-2 border-muted bg-surface-elevated p-4 text-left transition-all hover:border-primary hover:bg-muted/50 hover:shadow-md"
                  >
                    <span className="font-medium text-foreground">{path.label}</span>
                    <svg
                      className="h-5 w-5 text-muted-foreground"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth={2}
                        d="M9 5l7 7-7 7"
                      />
                    </svg>
                  </button>
                )}
              </div>
            ))}
          </div>
        </div>

        {/* Footer with Back button */}
        {history.length > 0 && (
          <div className="border-t bg-muted p-4">
            <Button
              onClick={handleBack}
              variant="outline"
              className="w-full border-muted-foreground/30 text-muted-foreground hover:bg-surface-elevated hover:text-foreground"
            >
              ← Back
            </Button>
          </div>
        )}
      </div>
    </div>
  );
};

export default WizardModal;
