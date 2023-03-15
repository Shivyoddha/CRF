# Preview all emails at http://localhost:3000/rails/mailers/ansys_mailer
class AnsysMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ansys_mailer/mail
  def mail
    AnsysMailer.mail
  end

end
