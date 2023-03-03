# Preview all emails at http://localhost:3000/rails/mailers/payement_xrd_mailer
class PayementXrdMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payement_xrd_mailer/Mail
  def Mail
    PayementXrdMailer.Mail
  end

end
