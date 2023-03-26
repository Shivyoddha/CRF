# Preview all emails at http://localhost:3000/rails/mailers/bet_alloted_mailer
class BetAllotedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bet_alloted_mailer/Mail
  def Mail
    BetAllotedMailer.Mail
  end

end
