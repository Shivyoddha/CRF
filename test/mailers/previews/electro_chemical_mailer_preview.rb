# Preview all emails at http://localhost:3000/rails/mailers/electro_chemical_mailer
class ElectroChemicalMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/electro_chemical_mailer/Mail
  def Mail
    ElectroChemicalMailer.Mail
  end

end
