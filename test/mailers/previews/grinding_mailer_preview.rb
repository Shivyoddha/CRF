# Preview all emails at http://localhost:3000/rails/mailers/grinding_mailer
class GrindingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/grinding_mailer/Mail
  def Mail
    GrindingMailer.Mail
  end

end
