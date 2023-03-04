# Preview all emails at http://localhost:3000/rails/mailers/gait_alloted_mailer
class GaitAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gait_alloted_mailer/Mail
  def Mail
    GaitAllotedMailer.Mail
  end

end
