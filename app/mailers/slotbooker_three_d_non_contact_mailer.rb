class SlotbookerThreeDNonContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.slotbooker_three_d_non_contact_mailer.Mail.subject
  #
  def Mail
    @equipment_table=EquipmentTable.find(params[:id])
    @user=User.find(params[:userid])
      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@equipment_table.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Demand Reciept Recievd ",
            locals:{equipment_table:@equipment_table,user:@user}
          )
  end
  end
