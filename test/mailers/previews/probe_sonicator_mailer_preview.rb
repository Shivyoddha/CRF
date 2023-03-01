# Preview all emails at http://localhost:3000/rails/mailers/probe_sonicator_mailer
class ProbeSonicatorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/probe_sonicator_mailer/Mail
  def Mail
    ProbeSonicatorMailer.Mail
  end

end
