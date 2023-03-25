class FiveAxiMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.five_axis_mailer.Mail.subject
  #
  def InternalMail
    @five_axi=FiveAxi.find(params[:id])
    @user=User.find(params[:userid])
    attachments["five_axi.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/five_axi.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{five_axi:@five_axi,user:@user}
          )
  end
  def ExternalMail
    @five_axi=FiveAxi.find(params[:id])
    @user=User.find(params[:userid])
    attachments["five_axi.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/five_axi.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{five_axi:@five_axi,user:@user}
          )
  end
end
