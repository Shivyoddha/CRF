# Preview all emails at http://localhost:3000/rails/mailers/laser_alloted_mailer
class LaserAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/laser_alloted_mailer/Mail
  def Mail
    LaserAllotedMailer.Mail
  end

end
