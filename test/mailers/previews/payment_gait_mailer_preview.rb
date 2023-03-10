# Preview all emails at http://localhost:3000/rails/mailers/payment_gait_mailer
class PaymentGaitMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_gait_mailer/Mail
  def Mail
    PaymentGaitMailer.Mail
  end

end
