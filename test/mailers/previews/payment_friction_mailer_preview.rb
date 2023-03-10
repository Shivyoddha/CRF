# Preview all emails at http://localhost:3000/rails/mailers/payment_friction_mailer
class PaymentFrictionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_friction_mailer/Mail
  def Mail
    PaymentFrictionMailer.Mail
  end

end
