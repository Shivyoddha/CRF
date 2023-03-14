# Preview all emails at http://localhost:3000/rails/mailers/ft_nmr_mailer
class FtNmrMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ft_nmr_mailer/Mail
  def Mail
    FtNmrMailer.Mail
  end

end
