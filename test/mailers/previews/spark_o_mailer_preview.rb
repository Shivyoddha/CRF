# Preview all emails at http://localhost:3000/rails/mailers/spark_o_mailer
class SparkOMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/spark_o_mailer/Mail
  def Mail
    SparkOMailer.Mail
  end

end
