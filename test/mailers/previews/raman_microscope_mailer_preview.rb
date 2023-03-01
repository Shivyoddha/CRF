# Preview all emails at http://localhost:3000/rails/mailers/raman_microscope_mailer
class RamanMicroscopeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/raman_microscope_mailer/Mail
  def Mail
    RamanMicroscopeMailer.Mail
  end

end
