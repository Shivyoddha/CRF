class LowFatigueMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.low_fatigue_mailer.Mail.subject
  #
  def InternalMail
    @low_fatigue=LowFatigue.find(params[:id])
    @user=User.find(params[:userid])
    attachments["low_fatigue.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/low_fatigue.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{low_fatigue:@low_fatigue,user:@user}
        )
  end
  def ExternalMail
    @low_fatigue=LowFatigue.find(params[:id])
    @user=User.find(params[:userid])
    attachments["low_fatigue.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/low_fatigue.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{low_fatigue:@low_fatigue,user:@user}
        )
  end
end
