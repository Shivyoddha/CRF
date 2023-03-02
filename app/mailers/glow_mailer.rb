class GlowMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.glow_mailer.Mail.subject
  #
  def Mail
    @glow=Glow.find(params[:id])
    @user=User.find(params[:userid])
    attachments["glow.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/glow.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{glow:@glow,user:@user}
        )
  end
end
