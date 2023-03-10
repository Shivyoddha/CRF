# Preview all emails at http://localhost:3000/rails/mailers/payment_glove_box_mailer
class PaymentGloveBoxMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_glove_box_mailer/Mail
  def Mail
    PaymentGloveBoxMailer.Mail
  end

end
