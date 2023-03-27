class BetAllotedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bet_alloted_mailer.Mail.subject
  #
  def Mail
    @ball_mailing=BallMailing.find(params[:id])
    @user=User.find(params[:userid])


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Slot Alloted",
          )

  end
end
