# Preview all emails at http://localhost:3000/rails/mailers/micro_edm_mailer
class MicroEdmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/micro_edm_mailer/Mail
  def Mail
    MicroEdmMailer.Mail
  end

end
