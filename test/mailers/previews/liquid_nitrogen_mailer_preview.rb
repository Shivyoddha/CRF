# Preview all emails at http://localhost:3000/rails/mailers/liquid_nitrogen_mailer
class LiquidNitrogenMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/liquid_nitrogen_mailer/Mail
  def Mail
    LiquidNitrogenMailer.Mail
  end

end
