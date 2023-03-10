# Preview all emails at http://localhost:3000/rails/mailers/payment_tribometer_mailer
class PaymentTribometerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_tribometer_mailer/Mail
  def Mail
    PaymentTribometerMailer.Mail
  end

end
