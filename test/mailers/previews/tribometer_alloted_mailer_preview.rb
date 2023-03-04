# Preview all emails at http://localhost:3000/rails/mailers/tribometer_alloted_mailer
class TribometerAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tribometer_alloted_mailer/Mail
  def Mail
    TribometerAllotedMailer.Mail
  end

end
