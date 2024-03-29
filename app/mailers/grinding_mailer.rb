class GrindingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.grinding_mailer.Mail.subject
  #
  def InternalMail
    @grinding=Grinding.find(params[:id])
    @user=User.find(params[:userid])
    attachments["grinding.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/grinding.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{grinding:@grinding,user:@user}
        )
  end
  def ExternalMail
    @grinding=Grinding.find(params[:id])
    @user=User.find(params[:userid])
    attachments["grinding.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/grinding.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{grinding:@grinding,user:@user}
        )
  end
end
