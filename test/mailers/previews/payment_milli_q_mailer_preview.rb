# Preview all emails at http://localhost:3000/rails/mailers/payment_milli_q_mailer
class PaymentMilliQMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_milli_q_mailer/Mail
  def Mail
    PaymentMilliQMailer.Mail
  end

end
