# Preview all emails at http://localhost:3000/rails/mailers/payment_glow_mailer
class PaymentGlowMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_glow_mailer/Mail
  def Mail
    PaymentGlowMailer.Mail
  end

end
