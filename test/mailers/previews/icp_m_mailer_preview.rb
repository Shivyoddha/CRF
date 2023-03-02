# Preview all emails at http://localhost:3000/rails/mailers/icp_m_mailer
class IcpMMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/icp_m_mailer/Mail
  def Mail
    IcpMMailer.Mail
  end

end
