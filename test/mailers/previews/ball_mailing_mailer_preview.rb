# Preview all emails at http://localhost:3000/rails/mailers/ball_mailing_mailer
class BallMailingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ball_mailing_mailer/Mail
  def Mail
    BallMailingMailer.Mail
  end

end
