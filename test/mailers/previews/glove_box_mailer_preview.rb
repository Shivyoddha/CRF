# Preview all emails at http://localhost:3000/rails/mailers/glove_box_mailer
class GloveBoxMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/glove_box_mailer/Mail
  def Mail
    GloveBoxMailer.Mail
  end

end
