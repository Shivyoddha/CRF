class TribometerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tribometer_mailer.Mail.subject
  #
  def InternalMail
    @tribometer=Tribometer.find(params[:id])
    @user=User.find(params[:userid])
    attachments["tribometer.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/tribometer.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{tribometer:@tribometer,user:@user}
        )
  end
  def ExternalMail
    @tribometer=Tribometer.find(params[:id])
    @user=User.find(params[:userid])
    attachments["tribometer.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/tribometer.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{tribometer:@tribometer,user:@user}
        )
  end
end
