# Preview all emails at http://localhost:3000/rails/mailers/hr_lcm_mailer
class HrLcmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hr_lcm_mailer/Mail
  def Mail
    HrLcmMailer.Mail
  end

end
