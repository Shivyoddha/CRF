# Preview all emails at http://localhost:3000/rails/mailers/payment_icp_m_mailer
class PaymentIcpMMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_icp_m_mailer/Mail
  def Mail
    PaymentIcpMMailer.Mail
  end

end
