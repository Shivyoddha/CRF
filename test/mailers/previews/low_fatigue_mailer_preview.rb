# Preview all emails at http://localhost:3000/rails/mailers/low_fatigue_mailer
class LowFatigueMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/low_fatigue_mailer/Mail
  def Mail
    LowFatigueMailer.Mail
  end

end
