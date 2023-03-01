# Preview all emails at http://localhost:3000/rails/mailers/hr_fesem_c_mailer
class HrFesemCMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hr_fesem_c_mailer/Mail
  def Mail
    HrFesemCMailer.Mail
  end

end
