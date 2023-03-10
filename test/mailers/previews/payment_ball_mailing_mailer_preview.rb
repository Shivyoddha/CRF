# Preview all emails at http://localhost:3000/rails/mailers/payment_ball_mailing_mailer
class PaymentBallMailingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_ball_mailing_mailer/Mail
  def Mail
    PaymentBallMailingMailer.Mail
  end

end
