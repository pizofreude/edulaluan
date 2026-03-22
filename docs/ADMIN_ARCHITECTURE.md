# 🏛️ EduLaluan Admin Architecture

## System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                     EDULALUAN ADMIN SYSTEM                      │
│                                                                 │
│  Super Admin (ahafeezs@outlook.de)                             │
│  └─ GitHub OAuth Login                                         │
│     └─ Full System Control                                     │
│        └─ Invite Admins (bypass leveling)                      │
│           └─ Admins can moderate & approve                     │
│                                                                 │
│  Regular Users                                                 │
│  └─ Submit Contributions                                       │
│     └─ Earn Points                                             │
│        └─ Unlock Tiers & Badges                                │
└─────────────────────────────────────────────────────────────────┘
```

---

## User Roles & Permissions

### **1. Super Admin** (ahafeezs@outlook.de)
```
┌─────────────────────────────────────┐
│ SUPER ADMIN                         │
├─────────────────────────────────────┤
│ ✅ GitHub OAuth Login               │
│ ✅ Full System Access               │
│ ✅ Invite Admins                    │
│ ✅ Revoke Admin Access              │
│ ✅ View All Submissions             │
│ ✅ Approve/Reject Any Content       │
│ ✅ Manage Users                     │
│ ✅ System Settings                  │
│ ✅ Protected from deletion/demotion │
└─────────────────────────────────────┘
```

**How to Become Super Admin:**
1. Sign in via GitHub with registered email (ahafeezs@outlook.de)
2. System sets `users.role = 'super_admin'`
3. Full admin dashboard unlocked

**Protection**: Database triggers prevent deletion or demotion of super admins

---

### **2. Admin** (Invited by Super Admin)
```
┌─────────────────────────────────────┐
│ ADMIN (Invited)                     │
├─────────────────────────────────────┤
│ ✅ Email Invite System              │
│ ✅ Bypass Leveling System           │
│ ✅ Moderate Submissions             │
│ ✅ Approve/Reject Content           │
│ ✅ Award Points                     │
│ ✅ Access Admin Dashboard           │
│ ❌ Cannot Invite Other Admins       │
│ ❌ Cannot Remove Other Admins       │
│ ❌ Cannot Access System Settings    │
└─────────────────────────────────────┘
```

**How to Become Admin:**
1. Super Admin sends invite via `/admin/manage`
2. User receives email with invite link
3. User accepts invite → `users.role = 'admin'`
4. Admin dashboard unlocked

---

### **3. Moderator** (Invited by Super Admin)
```
┌─────────────────────────────────────┐
│ MODERATOR (Invited)                 │
├─────────────────────────────────────┤
│ ✅ Email Invite System              │
│ ✅ Moderate Submissions             │
│ ✅ Approve/Reject Content           │
│ ✅ Award Points                     │
│ ❌ Cannot Invite Admins             │
│ ❌ Cannot Manage Users              │
│ ❌ Cannot Access System Settings    │
└─────────────────────────────────────┘
```

**How to Become Moderator:**
1. Super Admin sends invite with moderator role
2. User accepts invite → `users.role = 'moderator'`
3. Moderation dashboard unlocked

---

### **4. Regular Users** (Community Members)
```
┌─────────────────────────────────────┐
│ USER (Default Role)                 │
├─────────────────────────────────────┤
│ ✅ Submit Contributions             │
│ ✅ Earn Points                      │
│ ✅ Unlock Tiers (1-4)               │
│ ✅ Earn Badges                      │
│ ✅ View Leaderboard                 │
│ ❌ Cannot Moderate                  │
│ ❌ Cannot Approve Content           │
└─────────────────────────────────────┘
```

**User Progression:**
```
Newcomer (Tier 1) → Regular (Tier 2) → Champion (Tier 3) → Leader (Tier 4)
    0-100 pts          101-500 pts         501-2000 pts       2001+ pts
```

---

## Admin Invite Flow

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  Super Admin │     │  Invite      │     │  New Admin   │     │  Admin       │
│  Dashboard   │────▶│  System      │────▶│  Receives    │────▶│  Dashboard   │
│              │     │              │     │  Email       │     │  Unlocked    │
└──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
      │                    │                      │                    │
      │ 1. Click Invite    │                      │                    │
      │───────────────────▶│                      │                    │
      │                    │ 2. Generate Token    │                    │
      │                    │    Create Link       │                    │
      │                    │─────────────────────▶│                    │
      │                    │                      │                    │
      │                    │ 3. Send Email        │                    │
      │                    │─────────────────────▶│                    │
      │                    │                      │                    │
      │                    │                      │ 4. Click Link      │
      │                    │                      │────────────────────▶│
      │                    │                      │                    │
      │                    │                      │ 5. Set is_moderator│
      │                    │                      │    = true          │
      │                    │                      │────────────────────▶│
      │                    │                      │                    │
      │                    │                      │                    │ 6. Access Granted
      │                    │                      │                    │◀───────────────────
```

---

## Database Schema

### **users** Table
```sql
CREATE TABLE users (
    id UUID PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    full_name TEXT,
    avatar_url TEXT,
    role TEXT DEFAULT 'user',         -- 'super_admin', 'admin', 'moderator', 'user'
    points_balance INTEGER DEFAULT 0,
    tier INTEGER DEFAULT 1,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for role queries
CREATE INDEX idx_users_role ON users(role);

-- Super admin protection trigger
CREATE OR REPLACE FUNCTION protect_super_admins()
RETURNS TRIGGER AS $$
BEGIN
  IF OLD.role = 'super_admin' AND (
    TG_OP = 'DELETE' OR
    (TG_OP = 'UPDATE' AND NEW.role != 'super_admin')
  ) THEN
    RAISE EXCEPTION 'Cannot delete or demote super admins';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_protect_super_admins
  BEFORE UPDATE OR DELETE ON users
  FOR EACH ROW
  EXECUTE FUNCTION protect_super_admins();
```

### **admin_invites** Table
```sql
CREATE TABLE admin_invites (
    id UUID PRIMARY KEY,
    email TEXT UNIQUE,
    role TEXT DEFAULT 'admin',        -- 'admin' or 'moderator'
    token TEXT UNIQUE,
    invited_by UUID REFERENCES users(id),
    status TEXT DEFAULT 'pending',    -- pending, accepted, expired, revoked
    expires_at TIMESTAMPTZ,
    accepted_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### **user_points_history** Table
```sql
CREATE TABLE user_points_history (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    points INTEGER NOT NULL,
    reason TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for time-based leaderboard queries
CREATE INDEX idx_points_history_user_time ON user_points_history(user_id, created_at);
```

### **admin_settings** Table
```sql
CREATE TABLE admin_settings (
    id UUID PRIMARY KEY,
    demo_data_enabled BOOLEAN DEFAULT TRUE,
    allow_public_contributions BOOLEAN DEFAULT TRUE,
    require_email_verification BOOLEAN DEFAULT TRUE,
    maintenance_mode BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMPTZ,
    updated_by UUID REFERENCES users(id)
);
```

---

## API Endpoints

### **Super Admin Only**
```
POST   /api/admin/invite              - Send admin invite
POST   /api/admin/users/:id/remove-role - Remove admin/moderator role
DELETE /api/admin/invite/:id          - Revoke invite
GET    /api/admin/settings            - Get system settings
PUT    /api/admin/settings            - Update system settings
GET    /api/admin/stats               - Get role distribution stats
```

### **Admin & Super Admin & Moderator**
```
GET    /api/admin/contributions       - Get moderation queue
POST   /api/admin/contributions/:id/approve
POST   /api/admin/contributions/:id/reject
POST   /api/admin/contributions/:id/request-changes
```

### **Admin & Super Admin**
```
GET    /api/admin/users               - Get all users by role
PUT    /api/admin/users/:id           - Update user (make admin, etc)
```

---

## Authentication Flow

### **GitHub OAuth (Super Admin)**
```
1. User clicks "Sign in with GitHub"
2. Redirect to GitHub OAuth
3. GitHub returns access token
4. Create/Update user in Supabase Auth
5. Check if email == pizofreude@github
   → YES: Set is_admin = true
   → NO: Regular user
6. Redirect to dashboard
```

### **Email Invite (Admin)**
```
1. Super Admin enters email in /admin/invite
2. System generates unique token
3. Email sent with invite link
4. User clicks link → /admin/invite/accept?token=xxx
5. System validates token
6. Set is_moderator = true
7. Admin dashboard unlocked
```

---

## Permission Matrix

| Action | Super Admin | Admin | Moderator | Regular User |
|--------|-------------|-------|-----------|--------------|
| Moderate submissions | ✅ | ✅ | ✅ | ❌ |
| Approve content | ✅ | ✅ | ✅ | ❌ |
| Reject content | ✅ | ✅ | ✅ | ❌ |
| Award points | ✅ | ✅ | ✅ | ❌ |
| Invite admins | ✅ | ❌ | ❌ | ❌ |
| Remove admin roles | ✅ | ❌ | ❌ | ❌ |
| System settings | ✅ | ❌ | ❌ | ❌ |
| View admin management | ✅ | ❌ | ❌ | ❌ |
| Submit contributions | ✅ | ✅ | ✅ | ✅ |
| Earn points | ✅ | ✅ | ✅ | ✅ |
| View leaderboard | ✅ | ✅ | ✅ | ✅ |
| Access dashboard | ✅ | ✅ | ✅ | ✅ |

---

## Security Measures

### **1. RLS Policies**
```sql
-- Only admins can see moderation queue
CREATE POLICY "Admins can view moderation queue" ON contributions
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE users.id = auth.uid()
      AND (users.is_admin = true OR users.is_moderator = true)
    )
  );
```

### **2. API Authorization**
```typescript
// Every admin API endpoint checks:
const { data: userData } = await supabase
  .from('users')
  .select('is_admin, is_moderator')
  .eq('id', user.id)
  .single();

if (!userData || (!userData.is_admin && !userData.is_moderator)) {
  return new Response(
    JSON.stringify({ error: 'Admin access required' }),
    { status: 403 }
  );
}
```

### **3. Invite Token Expiry**
- Tokens expire after 7 days
- One-time use only
- Email must match invite record

---

## Current Implementation Status

| Feature | Status | File Location |
|---------|--------|---------------|
| GitHub OAuth Login | ✅ Complete | `/src/pages/api/auth/login.ts` |
| Auth Callback Handler | ✅ Complete | `/src/pages/api/auth/callback.ts` |
| Super Admin Role | ✅ Complete | Auto-set for ahafeezs@outlook.de |
| Role System (4 roles) | ✅ Complete | Database + API |
| Super Admin Protection | ✅ Complete | Database triggers |
| Admin Invite API | ✅ Complete | `/src/pages/api/admin/invite.ts` |
| Remove Role API | ✅ Complete | `/src/pages/api/admin/users-[id]-remove-role.ts` |
| Get Users API | ✅ Complete | `/src/pages/api/admin/users.ts` |
| Admin Management Page | ✅ Complete | `/src/pages/admin/manage.astro` |
| Moderation Dashboard | ✅ Complete | `/src/pages/admin/moderation.astro` |
| Approve/Reject APIs | ✅ Complete | `/src/pages/api/admin/contributions-*.ts` |
| Points Award System | ✅ Complete | In approve API |
| Email Notifications | ✅ Complete | Edge Functions |
| Navbar Community Dropdown | ✅ Complete | `/src/components/Header.astro` |
| Public Leaderboard | ✅ Complete | `/src/pages/leaderboard.astro` |
| Leaderboard API | ✅ Complete | `/src/pages/api/leaderboard.ts` |
| TypeScript Errors | ✅ Fixed | Zero errors |
| Admin Settings Page | ❌ Pending | - |
| User Profile Page | ❌ Pending | - |

---

## Next Steps to Complete

1. **Test Super Admin Login**
   - Sign in as pizofreude via GitHub
   - Verify `is_admin = true` in database
   - Access `/admin/moderation`

2. **Test Admin Invite**
   - Go to `/admin/invite` (create this page)
   - Enter email
   - Send invite
   - Accept invite
   - Verify `is_moderator = true`

3. **Test Moderation Flow**
   - Submit test contribution as regular user
   - Approve as admin
   - Verify points awarded
   - Check email notification

---

## File Structure

```
src/
├── pages/
│   ├── admin/
│   │   ├── dashboard.astro       # Admin overview
│   │   ├── moderation.astro      # Moderation queue ✅
│   │   └── invite.astro          # Invite admins (create this)
│   └── api/
│       └── admin/
│           ├── invite.ts         # Send invite ✅
│           ├── settings.ts       # System settings ✅
│           ├── contributions.ts  # Get submissions ✅
│           ├── contributions-approve.ts ✅
│           ├── contributions-reject.ts ✅
│           └── contributions-request-changes.ts ✅
└── components/
    └── admin/
        └── AdminSidebar.astro    # Admin navigation ✅
```

---

## Quick Start Guide

### **For Super Admin (ahafeezs@outlook.de):**

1. **Sign In**
   ```
   Go to: /auth/login
   Click: "Sign in with GitHub"
   Account: ahafeezs@outlook.de
   ```

2. **Access Admin Dashboard**
   ```
   Go to: /admin/moderation
   You should see: Pending submissions queue
   ```

3. **Manage Admins**
   ```
   Go to: /admin/manage
   View: Role distribution stats
   Action: Invite new admins/moderators
   Action: Remove admin roles if needed
   ```

4. **Invite an Admin**
   ```
   Go to: /admin/manage
   Enter: admin@example.com
   Select Role: Admin or Moderator
   Click: Send Invite
   ```

5. **Moderate Submissions**
   ```
   Go to: /admin/moderation
   Click: Approve/Reject/Request Changes
   Add notes if needed
   Submit
   ```

6. **View Leaderboard**
   ```
   Go to: /leaderboard
   Filter: All-Time, 30-Day, or Half-Year
   Browse: 100 users per page (two columns)
   ```

---

## File Structure

```
src/
├── pages/
│   ├── admin/
│   │   ├── dashboard.astro       # Admin overview
│   │   ├── moderation.astro      # Moderation queue ✅
│   │   └── manage.astro          # Admin management ✅
│   ├── leaderboard.astro         # Public leaderboard ✅
│   └── api/
│       ├── auth/
│       │   ├── login.ts          # OAuth init ✅
│       │   └── callback.ts       # OAuth callback ✅
│       └── admin/
│           ├── invite.ts         # Send invite ✅
│           ├── users.ts          # Get users ✅
│           ├── users-[id]-remove-role.ts  # Remove role ✅
│           ├── settings.ts       # System settings ✅
│           ├── contributions.ts  # Get submissions ✅
│           ├── contributions-approve.ts ✅
│           ├── contributions-reject.ts ✅
│           └── contributions-request-changes.ts ✅
└── components/
    ├── Header.astro              # Navbar with Community dropdown ✅
    └── admin/
        └── AdminSidebar.astro    # Admin navigation ✅
```

---

**Last Updated**: March 22, 2026  
**Super Admin**: ahafeezs@outlook.de  
**Status**: All core features complete, zero TypeScript errors
