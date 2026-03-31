import { defineConfig } from 'astro/config';
import react from '@astrojs/react';
import tailwind from '@astrojs/tailwind';
import netlify from '@astrojs/netlify';

// https://astro.build/config
export default defineConfig({
  site: 'https://edulaluan.netlify.app',
  integrations: [
    react(),
    tailwind({
      applyBaseStyles: false,
    }),
  ],
  output: 'server',
  adapter: netlify(),
  vite: {
    build: {
      rollupOptions: {
        output: {}
      }
    }
  },
  // Experimental CSP support - Astro 5.9+
  // Uses hash-based CSP for scripts and styles
  experimental: {
    csp: {
      // Use SHA-512 for stronger hashes
      algorithm: 'SHA-512',
      // Additional CSP directives
      directives: [
        "default-src 'self'",
        "connect-src 'self' https://*.supabase.co wss://*.supabase.co https://*.withcallout.com",
        "img-src 'self' data: https:",
        "font-src 'self' data: https://fonts.gstatic.com",
        "frame-src 'self'"
      ],
      // Configure script-src directive
      scriptDirective: {
        // Note: strict-dynamic disabled to allow 'self' for bundled scripts
        // Astro will auto-generate hashes for inline scripts
        resources: ["'self'", "https://cdn.withcallout.com"]
      },
      // Configure style-src directive for Google Fonts
      styleDirective: {
        resources: ["'self'", "'unsafe-inline'", "https://fonts.googleapis.com"]
      }
    }
  }
});

