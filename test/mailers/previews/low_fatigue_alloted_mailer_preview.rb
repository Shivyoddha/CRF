# Preview all emails at http://localhost:3000/rails/mailers/low_fatigue_alloted_mailer
class LowFatigueAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/low_fatigue_alloted_mailer/Mail
  def Mail
    LowFatigueAllotedMailer.Mail
  end

end
