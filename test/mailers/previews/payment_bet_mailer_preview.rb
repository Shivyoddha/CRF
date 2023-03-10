# Preview all emails at http://localhost:3000/rails/mailers/payment_bet_mailer
class PaymentBetMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_bet_mailer/Mail
  def Mail
    PaymentBetMailer.Mail
  end

end
