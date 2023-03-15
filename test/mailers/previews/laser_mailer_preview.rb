# Preview all emails at http://localhost:3000/rails/mailers/laser_mailer
class LaserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/laser_mailer/Mail
  def Mail
    LaserMailer.Mail
  end

end
