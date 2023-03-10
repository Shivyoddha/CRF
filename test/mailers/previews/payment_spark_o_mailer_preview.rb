# Preview all emails at http://localhost:3000/rails/mailers/payment_spark_o_mailer
class PaymentSparkOMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_spark_o_mailer/Mail
  def Mail
    PaymentSparkOMailer.Mail
  end

end
