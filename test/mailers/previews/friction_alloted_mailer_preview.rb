# Preview all emails at http://localhost:3000/rails/mailers/friction_alloted_mailer
class FrictionAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/friction_alloted_mailer/Mail
  def Mail
    FrictionAllotedMailer.Mail
  end

end
