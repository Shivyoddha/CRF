# Preview all emails at http://localhost:3000/rails/mailers/xrd_alloted_mailer
class XrdAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/xrd_alloted_mailer/Mail
  def Mail
    XrdAllotedMailer.Mail
  end

end
