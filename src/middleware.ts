import { defineMiddleware } from 'astro:middleware';

function generateNonce(): string {
  const array = new Uint8Array(16);
  crypto.getRandomValues(array);
  return Array.from(array, byte => byte.toString(16).padStart(2, '0')).join('');
}

export const onRequest = defineMiddleware(async (context, next) => {
  const nonce = generateNonce();

  context.locals.nonce = nonce;

  const response = await next();

  response.headers.set('X-Frame-Options', 'SAMEORIGIN');
  response.headers.set('Referrer-Policy', 'strict-origin-when-cross-origin');
  response.headers.set('Permissions-Policy', 'geolocation=(), microphone=(), camera=()');

  response.headers.set(
    'Content-Security-Policy',
    `default-src 'self'; ` +
    `script-src 'self' 'nonce-${nonce}' 'unsafe-eval'; ` +
    `style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; ` +
    `font-src 'self' data: https://fonts.gstatic.com; ` +
    `img-src 'self' data: https:; ` +
    `connect-src 'self' https://*.supabase.co wss://*.supabase.co; ` +
    `frame-src 'self';`
  );

  return response;
});
