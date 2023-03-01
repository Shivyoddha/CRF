# Preview all emails at http://localhost:3000/rails/mailers/glow_mailer
class GlowMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/glow_mailer/Mail
  def Mail
    GlowMailer.Mail
  end

end
