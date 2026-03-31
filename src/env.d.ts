/// <reference path="../.astro/types.d.ts" />
/// <reference types="astro/client" />

declare namespace App {
  interface Locals {
    // Add custom locals types here
  }
}

interface Window {
  CalloutConfig?: {
    projectId: string;
  };
  Callout?: {
    identify: (user: { id: string; email: string; name?: string; traits?: Record<string, unknown> }) => void;
    complete: (milestone: string) => void;
    open: () => void;
    destroy: () => void;
    init: (config: { projectId: string }) => void;
  };
}
