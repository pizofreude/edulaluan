import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface ModerationDecisionPayload {
  userEmail: string;
  userName?: string;
  decision: "approved" | "rejected" | "changes_requested";
  contributionType: string;
  contributionTitle: string;
  pointsEarned?: number;
  rejectionReason?: string;
  moderationNotes?: string;
  changesRequested?: string;
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Parse request
    const payload: ModerationDecisionPayload = await req.json();
    const {
      userEmail,
      userName,
      decision,
      contributionType,
      contributionTitle,
      pointsEarned,
      rejectionReason,
      moderationNotes,
      changesRequested,
    } = payload;

    // Validate required fields
    if (!userEmail || !decision || !contributionType || !contributionTitle) {
      throw new Error("Missing required fields: userEmail, decision, contributionType, contributionTitle");
    }

    // Validate decision
    if (!["approved", "rejected", "changes_requested"].includes(decision)) {
      throw new Error("Decision must be 'approved', 'rejected', or 'changes_requested'");
    }

    // Get Supabase client
    const supabaseUrl = Deno.env.get("SUPABASE_URL") ?? "";
    const supabaseServiceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";
    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

    // Get site URL
    const siteUrl = Deno.env.get("SITE_URL") ?? "http://127.0.0.1:3000";

    // Build email content based on decision
    let emailSubject: string;
    let emailTitle: string;
    let emailMessage: string;
    let emailLink: string;

    switch (decision) {
      case "approved":
        emailSubject = `✅ Your ${contributionType} submission was approved!`;
        emailTitle = "Contribution Approved!";
        emailMessage = `Great news! Your ${contributionType} submission "${contributionTitle}" has been approved and is now live on EduLaluan.${pointsEarned ? ` You've earned ${pointsEarned} points!` : ""}`;
        emailLink = "/user/submissions";
        break;
      case "rejected":
        emailSubject = `❌ Update on your ${contributionType} submission`;
        emailTitle = "Contribution Update";
        emailMessage = `Your ${contributionType} submission "${contributionTitle}" was not approved. ${rejectionReason ? `Reason: ${rejectionReason}` : "Please review the moderation notes and consider resubmitting with improvements."}`;
        emailLink = "/user/submissions";
        break;
      case "changes_requested":
        emailSubject = `✏️ Changes requested for your ${contributionType} submission`;
        emailTitle = "Changes Requested";
        emailMessage = `Your ${contributionType} submission "${contributionTitle}" needs some changes before it can be approved. ${changesRequested || moderationNotes ? `Feedback: ${changesRequested || moderationNotes}` : "Please review the moderation notes and update your submission."}`;
        emailLink = "/user/submissions";
        break;
    }

    // Send email via database RPC
    const emailResponse = await supabase.rpc("send_moderation_decision_email", {
      p_to_email: userEmail,
      p_to_name: userName || null,
      p_decision: decision,
      p_contribution_type: contributionType,
      p_contribution_title: contributionTitle,
      p_points_earned: pointsEarned || null,
      p_rejection_reason: rejectionReason || null,
      p_moderation_notes: moderationNotes || null,
      p_changes_requested: changesRequested || null,
      p_site_url: siteUrl,
    });

    if (emailResponse.error) {
      console.error("Error sending moderation decision email:", emailResponse.error);
      // Fall back to external email service
      await sendViaExternalService(payload, siteUrl, emailSubject, emailTitle, emailMessage, emailLink);
    }

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: `Moderation decision email sent to ${userEmail}` 
      }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200,
      }
    );
  } catch (error) {
    console.error("Error in send-moderation-decision:", error);
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
  payload: ModerationDecisionPayload,
  siteUrl: string,
  subject: string,
  title: string,
  message: string,
  link: string
) {
  const emailProvider = Deno.env.get("EMAIL_PROVIDER") ?? "resend";
  const fromEmail = Deno.env.get("FROM_EMAIL") ?? "noreply@edulaluan.my";
  const fullLink = `${siteUrl}${link}`;

  const htmlContent = createModerationDecisionEmailHtml(
    payload,
    subject,
    title,
    message,
    fullLink
  );

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
        to: [payload.userEmail],
        subject: subject,
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
        personalizations: [{ to: [{ email: payload.userEmail }] }],
        from: { email: fromEmail },
        subject: subject,
        content: [{ type: "text/html", value: htmlContent }],
      }),
    });
  }

  console.log(`Moderation decision email sent to ${payload.userEmail} via ${emailProvider}`);
}

function createModerationDecisionEmailHtml(
  payload: ModerationDecisionPayload,
  subject: string,
  title: string,
  message: string,
  fullLink: string
): string {
  const { decision, contributionTitle, pointsEarned, rejectionReason, moderationNotes, changesRequested } = payload;

  // Determine icon and color based on decision
  let icon = "📧";
  let headerGradient = "linear-gradient(135deg, #667eea 0%, #764ba2 100%)";
  let actionButtonText = "View Submission";
  let detailBoxColor = "#f9fafb";
  let detailBoxBorderColor = "#667eea";

  switch (decision) {
    case "approved":
      icon = "✅";
      headerGradient = "linear-gradient(135deg, #11998e 0%, #38ef7d 100%)";
      actionButtonText = "View Submission";
      detailBoxColor = "#d1fae5";
      detailBoxBorderColor = "#11998e";
      break;
    case "rejected":
      icon = "❌";
      headerGradient = "linear-gradient(135deg, #eb3349 0%, #f45c43 100%)";
      actionButtonText = "View Feedback";
      detailBoxColor = "#fee2e2";
      detailBoxBorderColor = "#eb3349";
      break;
    case "changes_requested":
      icon = "✏️";
      headerGradient = "linear-gradient(135deg, #f093fb 0%, #f5576c 100%)";
      actionButtonText = "Make Changes";
      detailBoxColor = "#fef3c7";
      detailBoxBorderColor = "#f59e0b";
      break;
  }

  const greeting = payload.userName ? `Hello ${payload.userName},` : "Hello,";

  // Build detail content based on decision
  let detailContent = "";
  if (decision === "approved" && pointsEarned) {
    detailContent = `
      <div style="background-color: ${detailBoxColor}; border-left: 4px solid ${detailBoxBorderColor}; padding: 15px; margin: 20px 0; border-radius: 4px;">
        <p style="margin: 0 0 10px 0; color: #065f46; font-size: 16px; font-weight: 600;">
          🎉 Points Earned: ${pointsEarned}
        </p>
        <p style="margin: 0; color: #047857; font-size: 14px;">
          Your contribution has been published and is now visible to the EduLaluan community!
        </p>
      </div>
    `;
  } else if (decision === "rejected") {
    detailContent = `
      <div style="background-color: ${detailBoxColor}; border-left: 4px solid ${detailBoxBorderColor}; padding: 15px; margin: 20px 0; border-radius: 4px;">
        <p style="margin: 0 0 10px 0; color: #991b1b; font-size: 16px; font-weight: 600;">
          Reason for Rejection:
        </p>
        <p style="margin: 0; color: #b91c1c; font-size: 14px; line-height: 1.6;">
          ${rejectionReason || moderationNotes || "This submission did not meet our community guidelines."}
        </p>
      </div>
    `;
  } else if (decision === "changes_requested") {
    detailContent = `
      <div style="background-color: ${detailBoxColor}; border-left: 4px solid ${detailBoxBorderColor}; padding: 15px; margin: 20px 0; border-radius: 4px;">
        <p style="margin: 0 0 10px 0; color: #92400e; font-size: 16px; font-weight: 600;">
          Changes Needed:
        </p>
        <p style="margin: 0; color: #b45309; font-size: 14px; line-height: 1.6;">
          ${changesRequested || moderationNotes || "Please review your submission and make the necessary improvements."}
        </p>
      </div>
    `;
  }

  return `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EduLaluan Moderation Decision</title>
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
              
              ${detailContent}
              
              <div style="background-color: #f9fafb; padding: 15px; margin: 20px 0; border-radius: 4px;">
                <p style="margin: 0 0 5px 0; color: #6b7280; font-size: 14px;">
                  <strong>Submission:</strong>
                </p>
                <p style="margin: 0; color: #1f2937; font-size: 15px; font-weight: 500;">
                  ${contributionTitle}
                </p>
              </div>
              
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
              
              <p style="margin: 0 0 15px 0; color: #6b7280; font-size: 14px; line-height: 1.6;">
                Thank you for contributing to EduLaluan. Your participation helps make education resources more accessible to everyone.
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
                This email was sent to ${payload.userEmail}. You're receiving this because of your EduLaluan account settings.
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
