# Preview all emails at http://localhost:3000/rails/mailers/multi_impact_tester_mailer
class MultiImpactTesterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/multi_impact_tester_mailer/Mail
  def Mail
    MultiImpactTesterMailer.Mail
  end

end
