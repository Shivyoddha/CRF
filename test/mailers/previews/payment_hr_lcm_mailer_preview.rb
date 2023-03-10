# Preview all emails at http://localhost:3000/rails/mailers/payment_hr_lcm_mailer
class PaymentHrLcmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_hr_lcm_mailer/Mail
  def Mail
    PaymentHrLcmMailer.Mail
  end

end
