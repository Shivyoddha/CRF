# Preview all emails at http://localhost:3000/rails/mailers/payment_three_d_non_contact_mailer
class PaymentThreeDNonContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_three_d_non_contact_mailer/Mail
  def Mail
    PaymentThreeDNonContactMailer.Mail
  end

end
