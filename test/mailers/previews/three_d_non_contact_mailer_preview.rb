# Preview all emails at http://localhost:3000/rails/mailers/three_d_non_contact_mailer
class ThreeDNonContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/three_d_non_contact_mailer/Mail
  def Mail
    ThreeDNonContactMailer.Mail
  end

end
