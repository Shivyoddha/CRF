# Preview all emails at http://localhost:3000/rails/mailers/three_d_scanner_mailer
class ThreeDScannerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/three_d_scanner_mailer/Mail
  def Mail
    ThreeDScannerMailer.Mail
  end

end
