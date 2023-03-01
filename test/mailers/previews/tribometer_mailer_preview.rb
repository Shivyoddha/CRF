# Preview all emails at http://localhost:3000/rails/mailers/tribometer_mailer
class TribometerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tribometer_mailer/Mail
  def Mail
    TribometerMailer.Mail
  end

end
