# Preview all emails at http://localhost:3000/rails/mailers/payment_low_fatigue_mailer
class PaymentLowFatigueMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_low_fatigue_mailer/Mail
  def Mail
    PaymentLowFatigueMailer.Mail
  end

end
