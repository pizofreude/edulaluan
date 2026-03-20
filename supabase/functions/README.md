# Supabase Edge Functions for EduLaluan

Email notification Edge Functions for the EduLaluan platform.

## 📧 Available Functions

### 1. `send-invite-email`
Send admin/moderator invitation emails with beautiful HTML templates.

**Payload:**
```json
{
  "email": "user@example.com",
  "role": "admin",
  "invitedBy": "Admin Name",
  "inviteToken": "abc123"
}
```

**Invoke:**
```bash
curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/send-invite-email' \
  --header 'Authorization: Bearer YOUR_SERVICE_ROLE_KEY' \
  --header 'Content-Type: application/json' \
  --data '{"email":"user@example.com","role":"admin","invitedBy":"Admin","inviteToken":"abc123"}'
```

### 2. `send-notification`
Send user notifications (welcome, badge earned, tier promoted, etc.).

**Payload:**
```json
{
  "toEmail": "user@example.com",
  "toName": "User Name",
  "type": "badge_earned",
  "title": "Badge Earned! 🏆",
  "message": "You earned the Contributor badge!",
  "link": "/user/badges"
}
```

**Types:** `contribution_approved`, `contribution_rejected`, `changes_requested`, `badge_earned`, `tier_promoted`, `welcome`, `admin_invite`

**Invoke:**
```bash
curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/send-notification' \
  --header 'Authorization: Bearer YOUR_SERVICE_ROLE_KEY' \
  --header 'Content-Type: application/json' \
  --data '{"toEmail":"user@example.com","type":"welcome","title":"Welcome!","message":"Thanks for joining!"}'
```

### 3. `send-moderation-decision`
Send moderation decision emails (approved/rejected/changes_requested).

**Payload:**
```json
{
  "userEmail": "user@example.com",
  "userName": "User Name",
  "decision": "approved",
  "contributionType": "circumcision resource",
  "contributionTitle": "Klinik Kesihatan Cheras - Conventional sleeve",
  "pointsEarned": 75,
  "rejectionReason": "Incomplete information",
  "changesRequested": "Please add more details about the procedure"
}
```

**Invoke:**
```bash
curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/send-moderation-decision' \
  --header 'Authorization: Bearer YOUR_SERVICE_ROLE_KEY' \
  --header 'Content-Type: application/json' \
  --data '{"userEmail":"user@example.com","decision":"approved","contributionType":"resource","contributionTitle":"Test Submission","pointsEarned":50}'
```

## 🚀 Local Development

### 1. Start Supabase Local Development

```bash
cd C:\workspace\edulaluan
npm run supabase:start
```

### 2. Set Up Environment Variables

```bash
cd supabase/functions
cp .env.example .env.local
```

Edit `.env.local` with your credentials.

### 3. Apply Database Migrations

```bash
npm run db:push
```

### 4. Test Edge Functions

```bash
# Test send-invite-email
curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/send-invite-email' \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU' \
  --header 'Content-Type: application/json' \
  --data '{"email":"test@example.com","role":"admin","invitedBy":"Test Admin","inviteToken":"test123"}'

# View sent emails in Inbucket (local email tester)
# Open: http://127.0.0.1:54324
```

## 🌐 Production Deployment

### 1. Deploy Edge Functions

```bash
# Deploy all functions
npx supabase functions deploy

# Deploy specific function
npx supabase functions deploy send-invite-email
npx supabase functions deploy send-notification
npx supabase functions deploy send-moderation-decision
```

### 2. Set Production Secrets

```bash
# Set email provider
npx supabase secrets set EMAIL_PROVIDER=resend
npx supabase secrets set RESEND_API_KEY=re_your-key
npx supabase secrets set FROM_EMAIL=noreply@edulaluan.my
npx supabase secrets set SITE_URL=https://edulaluan.my

# Or use SendGrid
# npx supabase secrets set EMAIL_PROVIDER=sendgrid
# npx supabase secrets set SENDGRID_API_KEY=SG.your-key
```

### 3. Update Admin Settings

Update the `admin_settings` table with your Edge Function URL:

```sql
UPDATE admin_settings
SET config = jsonb_set(
  COALESCE(config, '{}'::jsonb),
  '{edge_function_url}',
  '"https://your-project.supabase.co/functions/v1"'
);
```

## 📊 Email Logging

All emails are logged to the `email_logs` table:

```sql
-- View recent emails
SELECT * FROM email_logs
ORDER BY created_at DESC
LIMIT 50;

-- View failed emails
SELECT * FROM email_logs
WHERE status = 'failed'
ORDER BY created_at DESC;

-- View emails by recipient
SELECT * FROM email_logs
WHERE to_email = 'user@example.com'
ORDER BY created_at DESC;
```

## 🎨 Email Templates

All emails use responsive HTML templates with:
- Gradient headers with icons
- Clear call-to-action buttons
- Mobile-friendly design
- Dark mode compatible colors
- Professional footer with branding

### Template Colors by Type:
- **Welcome/General**: Purple gradient (#667eea → #764ba2)
- **Approved**: Green gradient (#11998e → #38ef7d)
- **Rejected**: Red gradient (#eb3349 → #f45c43)
- **Changes Requested**: Pink gradient (#f093fb → #f5576c)
- **Badge Earned**: Gold gradient (#f7971e → #ffd200)

## 🔧 Troubleshooting

### Function Returns 400 Error
- Check payload structure matches expected schema
- Ensure all required fields are present
- Verify JSON syntax

### Email Not Sent
- Check `email_logs` table for error messages
- Verify email provider API key is correct
- Check Inbucket (local) or email provider dashboard (production)

### CORS Errors
- Ensure `corsHeaders` are included in response
- Check Edge Function is deployed correctly

## 📚 Resources

- [Supabase Edge Functions Docs](https://supabase.com/docs/guides/functions)
- [Resend API Docs](https://resend.com/docs/api-reference)
- [SendGrid API Docs](https://docs.sendgrid.com/api-reference)

---

💚 **EduLaluan** — Smart Education Resource Navigator for Malaysia
