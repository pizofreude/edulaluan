import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface InvitePayload {
  email: string;
  role: "admin" | "moderator";
  invitedBy: string;
  inviteToken: string;
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Parse request
    const payload: InvitePayload = await req.json();
    const { email, role, invitedBy, inviteToken } = payload;

    // Validate required fields
    if (!email || !role || !invitedBy || !inviteToken) {
      throw new Error("Missing required fields: email, role, invitedBy, inviteToken");
    }

    // Validate role
    if (!["admin", "moderator"].includes(role)) {
      throw new Error("Role must be either 'admin' or 'moderator'");
    }

    // Get Supabase client
    const supabaseUrl = Deno.env.get("SUPABASE_URL") ?? "";
    const supabaseServiceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";
    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

    // Get site URL for the invite link
    const siteUrl = Deno.env.get("SITE_URL") ?? "http://127.0.0.1:3000";
    const inviteLink = `${siteUrl}/auth/accept-invite?token=${inviteToken}`;

    // Send email via Supabase Auth email API or external SMTP
    // For now, we'll use the Supabase email sending capability
    const emailResponse = await supabase.rpc("send_invite_email", {
      p_to_email: email,
      p_role: role,
      p_invited_by: invitedBy,
      p_invite_link: inviteLink,
    });

    if (emailResponse.error) {
      console.error("Error sending invite email:", emailResponse.error);
      // Fall back to sending via external email service
      // For production, configure SendGrid, Resend, or AWS SES
      await sendViaExternalService(email, role, invitedBy, inviteLink);
    }

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: `Invite email sent to ${email} for ${role} role` 
      }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200,
      }
    );
  } catch (error) {
    console.error("Error in send-invite-email:", error);
    return new Response(
      JSON.stringify({ 
        success: false, 
        error: error instanceof Error ? error.message : "Unknown error" 
      }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 400,
      }
    );
  }
});

// Fallback email sender for production (SendGrid, Resend, AWS SES, etc.)
async function sendViaExternalService(
  to: string,
  role: string,
  invitedBy: string,
  inviteLink: string
) {
  const emailProvider = Deno.env.get("EMAIL_PROVIDER") ?? "resend";

  if (emailProvider === "resend") {
    const resendApiKey = Deno.env.get("RESEND_API_KEY");
    if (!resendApiKey) {
      throw new Error("RESEND_API_KEY not configured");
    }

    const fromEmail = Deno.env.get("FROM_EMAIL") ?? "noreply@edulaluan.my";

    await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${resendApiKey}`,
      },
      body: JSON.stringify({
        from: `EduLaluan <${fromEmail}>`,
        to: [to],
        subject: `You're invited to join EduLaluan as ${role === "admin" ? "an Admin" : "a Moderator"}`,
        html: createInviteEmailHtml(role, invitedBy, inviteLink),
      }),
    });
  } else if (emailProvider === "sendgrid") {
    const sendgridApiKey = Deno.env.get("SENDGRID_API_KEY");
    if (!sendgridApiKey) {
      throw new Error("SENDGRID_API_KEY not configured");
    }

    await fetch("https://api.sendgrid.com/v3/mail/send", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${sendgridApiKey}`,
      },
      body: JSON.stringify({
        personalizations: [{ to: [{ email: to }] }],
        from: { email: Deno.env.get("FROM_EMAIL") ?? "noreply@edulaluan.my" },
        subject: `You're invited to join EduLaluan as ${role === "admin" ? "an Admin" : "a Moderator"}`,
        content: [{ type: "text/html", value: createInviteEmailHtml(role, invitedBy, inviteLink) }],
      }),
    });
  }

  console.log(`Invite email sent to ${to} via ${emailProvider}`);
}

function createInviteEmailHtml(role: string, invitedBy: string, inviteLink: string): string {
  const roleTitle = role === "admin" ? "Admin" : "Moderator";
  const roleName = role === "admin" ? "an Admin" : "a Moderator";

  return `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EduLaluan Invitation</title>
</head>
<body style="margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f3f4f6;">
  <table role="presentation" style="width: 100%; border-collapse: collapse;">
    <tr>
      <td align="center" style="padding: 40px 0;">
        <table role="presentation" style="width: 100%; max-width: 600px; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
          <!-- Header -->
          <tr>
            <td style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 40px 30px; text-align: center;">
              <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 700;">🎉 You're Invited!</h1>
            </td>
          </tr>
          
          <!-- Content -->
          <tr>
            <td style="padding: 40px 30px;">
              <h2 style="margin: 0 0 20px 0; color: #1f2937; font-size: 24px; font-weight: 600;">Join EduLaluan as ${roleTitle}</h2>
              
              <p style="margin: 0 0 15px 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                Hello,
              </p>
              
              <p style="margin: 0 0 15px 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                You've been invited to join <strong>EduLaluan</strong> as <strong>${roleTitle}</strong> by <strong>${invitedBy}</strong>.
              </p>
              
              <p style="margin: 0 0 25px 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                As a ${roleTitle.toLowerCase()}, you'll help moderate community contributions, ensure content quality, and make a positive impact on Malaysia's education landscape.
              </p>
              
              <!-- CTA Button -->
              <table role="presentation" style="margin: 30px 0; border-collapse: collapse;">
                <tr>
                  <td align="center" style="border-radius: 6px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                    <a href="${inviteLink}" style="display: inline-block; padding: 16px 40px; color: #ffffff; text-decoration: none; font-size: 16px; font-weight: 600; border-radius: 6px;">
                      Accept Invitation →
                    </a>
                  </td>
                </tr>
              </table>
              
              <p style="margin: 0 0 15px 0; color: #6b7280; font-size: 14px; line-height: 1.6;">
                Or copy and paste this link into your browser:
              </p>
              <p style="margin: 0 0 25px 0; color: #667eea; font-size: 14px; word-break: break-all;">
                ${inviteLink}
              </p>
              
              <p style="margin: 0 0 15px 0; color: #6b7280; font-size: 14px; line-height: 1.6;">
                <strong>What's next?</strong>
              </p>
              <ul style="margin: 0 0 25px 0; padding-left: 20px; color: #4b5563; font-size: 14px; line-height: 1.8;">
                <li>Click the button above to accept your invitation</li>
                <li>Create your account or sign in</li>
                <li>Complete your profile</li>
                <li>Start making a difference in the community!</li>
              </ul>
              
              <p style="margin: 0; color: #6b7280; font-size: 14px; line-height: 1.6;">
                If you have any questions, feel free to reach out to our support team.
              </p>
            </td>
          </tr>
          
          <!-- Footer -->
          <tr>
            <td style="background-color: #f9fafb; padding: 30px; text-align: center; border-top: 1px solid #e5e7eb;">
              <p style="margin: 0 0 10px 0; color: #9ca3af; font-size: 14px;">
                EduLaluan — Smart Education Resource Navigator for Malaysia
              </p>
              <p style="margin: 0; color: #9ca3af; font-size: 12px;">
                This invitation was sent to ${to}. If you didn't expect this invitation, please ignore this email.
              </p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
  `.trim();
}
