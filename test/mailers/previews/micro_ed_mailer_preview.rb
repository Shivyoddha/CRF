# Preview all emails at http://localhost:3000/rails/mailers/micro_ed_mailer
class MicroEdMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/micro_ed_mailer/Mail
  def Mail
    MicroEdMailer.Mail
  end

end
