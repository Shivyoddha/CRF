# Preview all emails at http://localhost:3000/rails/mailers/scratch_indentation_mailer
class ScratchIndentationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/scratch_indentation_mailer/Mail
  def Mail
    ScratchIndentationMailer.Mail
  end

end
