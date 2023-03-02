# Preview all emails at http://localhost:3000/rails/mailers/gait_mailer
class GaitMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gait_mailer/Mail
  def Mail
    GaitMailer.Mail
  end

end
