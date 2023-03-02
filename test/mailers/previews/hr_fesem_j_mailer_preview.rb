# Preview all emails at http://localhost:3000/rails/mailers/hr_fesem_j_mailer
class HrFesemJMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hr_fesem_j_mailer/Mail
  def Mail
    HrFesemJMailer.Mail
  end

end
