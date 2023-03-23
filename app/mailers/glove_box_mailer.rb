class GloveBoxMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.glove_box_mailer.Mail.subject
  #
  def InternalMail
    @glove_box=GloveBox.find(params[:id])
    @user=User.find(params[:userid])
    attachments["glove_box.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/glove_box.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{glove_box:@glove_box,user:@user}
        )
  end
  def ExternalMail
    @glove_box=GloveBox.find(params[:id])
    @user=User.find(params[:userid])
    attachments["glove_box.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/glove_box.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{glove_box:@glove_box,user:@user}
        )
  end
end
