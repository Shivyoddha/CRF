# Preview all emails at http://localhost:3000/rails/mailers/tga_fttr_mailer
class TgaFttrMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tga_fttr_mailer/Mail
  def Mail
    TgaFttrMailer.Mail
  end

end
