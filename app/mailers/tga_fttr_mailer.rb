class TgaFttrMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tga_fttr_mailer.Mail.subject
  #
  def InternalMail
    @tga_fttr=TgaFttr.find(params[:id])
    @user=User.find(params[:userid])
    attachments["tga_fttr.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/tga_fttr.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{tga_fttr:@tga_fttr,user:@user}
        )
  end
  def ExternalMail
    @tga_fttr=TgaFttr.find(params[:id])
    @user=User.find(params[:userid])
    attachments["tga_fttr.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/tga_fttr.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{tga_fttr:@tga_fttr,user:@user}
        )
  end
end
