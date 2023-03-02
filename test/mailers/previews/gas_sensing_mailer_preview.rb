# Preview all emails at http://localhost:3000/rails/mailers/gas_sensing_mailer
class GasSensingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gas_sensing_mailer/Mail
  def Mail
    GasSensingMailer.Mail
  end

end
