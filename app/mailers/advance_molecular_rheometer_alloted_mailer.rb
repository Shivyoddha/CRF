class AdvanceMolecularRheometerAllotedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.advance_molecular_rheometer_alloted_mailer.Mail.subject
  #
  def Mail
    @advance_molecular_rheometer=AdvanceMolecularRheometer.find(params[:id])
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
