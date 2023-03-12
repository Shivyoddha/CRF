# Preview all emails at http://localhost:3000/rails/mailers/faculty_mailer
class FacultyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/faculty_mailer/Mail
  def Mail
    FacultyMailer.Mail
  end

end
