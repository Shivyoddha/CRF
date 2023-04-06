# Preview all emails at http://localhost:3000/rails/mailers/payment_grind_mailer
class PaymentGrindMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_grind_mailer/Mail
  def Mail
    PaymentGrindMailer.Mail
  end

end
