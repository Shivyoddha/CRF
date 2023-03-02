class UltraCentrifugeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ultra_centrifuge_mailer.Mail.subject
  #
  def Mail
    @ultra_centrifuge=UltraCentrifuge.find(params[:id])
    @user=User.find(params[:userid])
    attachments["ultra_centrifuge.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/ultra_centrifuge.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{ultra_centrifuge:@ultra_centrifuge,user:@user}
        )
  end
end
