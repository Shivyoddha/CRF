# Preview all emails at http://localhost:3000/rails/mailers/milli_q_mailer
class MilliQMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/milli_q_mailer/Mail
  def Mail
    MilliQMailer.Mail
  end

end
