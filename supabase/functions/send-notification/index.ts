import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface NotificationPayload {
  toEmail: string;
  toName?: string;
  type: "contribution_approved" | "contribution_rejected" | "changes_requested" | "badge_earned" | "tier_promoted" | "welcome" | "admin_invite";
  title: string;
  message: string;
  link?: string;
  contributionTitle?: string;
  badgeName?: string;
  pointsEarned?: number;
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Parse request
    const payload: NotificationPayload = await req.json();
    const { 
      toEmail, 
      toName, 
      type, 
      title, 
      message, 
      link,
      contributionTitle,
      badgeName,
      pointsEarned 
    } = payload;

    // Validate required fields
    if (!toEmail || !type || !title || !message) {
      throw new Error("Missing required fields: toEmail, type, title, message");
    }

    // Get Supabase client
    const supabaseUrl = Deno.env.get("SUPABASE_URL") ?? "";
    const supabaseServiceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";
    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

    // Get site URL
    const siteUrl = Deno.env.get("SITE_URL") ?? "http://127.0.0.1:3000";
    const fullLink = link ? `${siteUrl}${link}` : undefined;

    // Send email
    const emailResponse = await supabase.rpc("send_notification_email", {
      p_to_email: toEmail,
      p_to_name: toName || null,
      p_notification_type: type,
      p_title: title,
      p_message: message,
      p_link: fullLink || null,
    });

    if (emailResponse.error) {
      console.error("Error sending notification email:", emailResponse.error);
      // Fall back to external email service
      await sendViaExternalService(payload, fullLink);
    }

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: `Notification email sent to ${toEmail}` 
      }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200,
      }
    );
  } catch (error) {
    console.error("Error in send-notification:", error);
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

// Fallback email sender for production
async function sendViaExternalService(
  payload: NotificationPayload,
  fullLink?: string
) {
  const emailProvider = Deno.env.get("EMAIL_PROVIDER") ?? "resend";
  const fromEmail = Deno.env.get("FROM_EMAIL") ?? "noreply@edulaluan.my";

  const htmlContent = createNotificationEmailHtml(payload, fullLink);

  if (emailProvider === "resend") {
    const resendApiKey = Deno.env.get("RESEND_API_KEY");
    if (!resendApiKey) {
      throw new Error("RESEND_API_KEY not configured");
    }

    await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${resendApiKey}`,
      },
      body: JSON.stringify({
        from: `EduLaluan <${fromEmail}>`,
        to: [payload.toEmail],
        subject: payload.title,
        html: htmlContent,
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
        personalizations: [{ to: [{ email: payload.toEmail }] }],
        from: { email: fromEmail },
        subject: payload.title,
        content: [{ type: "text/html", value: htmlContent }],
      }),
    });
  }

  console.log(`Notification email sent to ${payload.toEmail} via ${emailProvider}`);
}

function createNotificationEmailHtml(payload: NotificationPayload, fullLink?: string): string {
  const { type, title, message, toName, contributionTitle, badgeName, pointsEarned } = payload;

  // Determine icon and color based on notification type
  let icon = "📧";
  let headerGradient = "linear-gradient(135deg, #667eea 0%, #764ba2 100%)";
  let actionButtonText = "View Details";

  switch (type) {
    case "contribution_approved":
      icon = "✅";
      headerGradient = "linear-gradient(135deg, #11998e 0%, #38ef7d 100%)";
      actionButtonText = "View Submission";
      break;
    case "contribution_rejected":
      icon = "❌";
      headerGradient = "linear-gradient(135deg, #eb3349 0%, #f45c43 100%)";
      actionButtonText = "View Feedback";
      break;
    case "changes_requested":
      icon = "✏️";
      headerGradient = "linear-gradient(135deg, #f093fb 0%, #f5576c 100%)";
      actionButtonText = "Make Changes";
      break;
    case "badge_earned":
      icon = "🏆";
      headerGradient = "linear-gradient(135deg, #f7971e 0%, #ffd200 100%)";
      actionButtonText = "View Badges";
      break;
    case "tier_promoted":
      icon = "📈";
      headerGradient = "linear-gradient(135deg, #667eea 0%, #764ba2 100%)";
      actionButtonText = "View Profile";
      break;
    case "welcome":
      icon = "👋";
      headerGradient = "linear-gradient(135deg, #667eea 0%, #764ba2 100%)";
      actionButtonText = "Get Started";
      break;
    case "admin_invite":
      icon = "🎉";
      headerGradient = "linear-gradient(135deg, #667eea 0%, #764ba2 100%)";
      actionButtonText = "Accept Invitation";
      break;
  }

  const greeting = toName ? `Hello ${toName},` : "Hello,";

  return `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EduLaluan Notification</title>
</head>
<body style="margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f3f4f6;">
  <table role="presentation" style="width: 100%; border-collapse: collapse;">
    <tr>
      <td align="center" style="padding: 40px 0;">
        <table role="presentation" style="width: 100%; max-width: 600px; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
          <!-- Header -->
          <tr>
            <td style="background: ${headerGradient}; padding: 40px 30px; text-align: center;">
              <div style="font-size: 48px; margin-bottom: 10px;">${icon}</div>
              <h1 style="margin: 0; color: #ffffff; font-size: 24px; font-weight: 700;">${title}</h1>
            </td>
          </tr>
          
          <!-- Content -->
          <tr>
            <td style="padding: 40px 30px;">
              <p style="margin: 0 0 15px 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                ${greeting}
              </p>
              
              <p style="margin: 0 0 25px 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                ${message}
              </p>
              
              ${contributionTitle ? `
                <div style="background-color: #f9fafb; border-left: 4px solid #667eea; padding: 15px; margin: 20px 0;">
                  <p style="margin: 0; color: #6b7280; font-size: 14px;">
                    <strong>Submission:</strong> ${contributionTitle}
                  </p>
                  ${pointsEarned ? `
                    <p style="margin: 10px 0 0 0; color: #11998e; font-size: 14px; font-weight: 600;">
                      🎉 Points Earned: ${pointsEarned}
                    </p>
                  ` : ""}
                </div>
              ` : ""}
              
              ${badgeName ? `
                <div style="text-align: center; padding: 20px; background-color: #fef3c7; border-radius: 8px; margin: 20px 0;">
                  <p style="margin: 0; color: #92400e; font-size: 18px; font-weight: 600;">
                    🏆 Badge Earned: ${badgeName}
                  </p>
                </div>
              ` : ""}
              
              ${fullLink ? `
                <!-- CTA Button -->
                <table role="presentation" style="margin: 30px 0; border-collapse: collapse;">
                  <tr>
                    <td align="center" style="border-radius: 6px; background: ${headerGradient};">
                      <a href="${fullLink}" style="display: inline-block; padding: 16px 40px; color: #ffffff; text-decoration: none; font-size: 16px; font-weight: 600; border-radius: 6px;">
                        ${actionButtonText} →
                      </a>
                    </td>
                  </tr>
                </table>
              ` : ""}
              
              <p style="margin: 0 0 15px 0; color: #6b7280; font-size: 14px; line-height: 1.6;">
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
                This email was sent to ${toEmail}. You're receiving this because of your EduLaluan account settings.
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
