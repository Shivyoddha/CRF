class UltraCentrifugeAllotedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ultra_centrifuge_alloted_mailer.Mail.subject
  #
  def Mail
    @ultra_centrifuge=UltraCentrifuge.find(params[:id])
    @user=User.find(params[:userid])

      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Slot Alloted"
          )
  end
end
