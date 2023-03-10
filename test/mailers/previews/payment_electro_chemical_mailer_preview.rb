# Preview all emails at http://localhost:3000/rails/mailers/payment_electro_chemical_mailer
class PaymentElectroChemicalMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_electro_chemical_mailer/Mail
  def Mail
    PaymentElectroChemicalMailer.Mail
  end

end
