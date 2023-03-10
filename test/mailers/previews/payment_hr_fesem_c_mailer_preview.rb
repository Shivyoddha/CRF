# Preview all emails at http://localhost:3000/rails/mailers/payment_hr_fesem_c_mailer
class PaymentHrFesemCMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_hr_fesem_c_mailer/Mail
  def Mail
    PaymentHrFesemCMailer.Mail
  end

end
