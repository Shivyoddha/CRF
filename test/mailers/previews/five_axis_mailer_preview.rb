# Preview all emails at http://localhost:3000/rails/mailers/five_axis_mailer
class FiveAxisMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/five_axis_mailer/Mail
  def Mail
    FiveAxisMailer.Mail
  end

end
