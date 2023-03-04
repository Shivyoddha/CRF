class IntegratedMultiRoleTesterAllotedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.integrated_multi_role_tester_alloted_mailer.Mail.subject
  #
  def Mail
    @integrated_multi_role_tester=IntegratedMultiRoleTester.find(params[:id])
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
