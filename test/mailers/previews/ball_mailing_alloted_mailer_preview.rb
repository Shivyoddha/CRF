# Preview all emails at http://localhost:3000/rails/mailers/ball_mailing_alloted_mailer
class BallMailingAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ball_mailing_alloted_mailer/Mail
  def Mail
    BallMailingAllotedMailer.Mail
  end

end
