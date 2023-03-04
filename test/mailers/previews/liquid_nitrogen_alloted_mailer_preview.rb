# Preview all emails at http://localhost:3000/rails/mailers/liquid_nitrogen_alloted_mailer
class LiquidNitrogenAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/liquid_nitrogen_alloted_mailer/Mail
  def Mail
    LiquidNitrogenAllotedMailer.Mail
  end

end
