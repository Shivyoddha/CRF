# Preview all emails at http://localhost:3000/rails/mailers/friction_mailer
class FrictionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/friction_mailer/Mail
  def Mail
    FrictionMailer.Mail
  end

end
