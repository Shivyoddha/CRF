class LiquidNitrogenMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.liquid_nitrogen_mailer.Mail.subject
  #
  def InternalMail
    @liquid_nitrogen=LiquidNitrogen.find(params[:id])
    @user=User.find(params[:userid])
    attachments["liquid_nitrogen.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/liquid_nitrogen.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )
    attachments["liquid_nitrogenpayment.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/liquid_nitrogenpayment.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )

      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            # to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{liquid_nitrogen:@liquid_nitrogen,user:@user}
        )

  end
  def ExternalMail
    @liquid_nitrogen=LiquidNitrogen.find(params[:id])
    @user=User.find(params[:userid])
    attachments["liquid_nitrogen.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/liquid_nitrogen.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )
    attachments["liquid_nitrogenpayment.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/liquid_nitrogenpayment.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )

      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            # to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{liquid_nitrogen:@liquid_nitrogen,user:@user}
        )

  end
end
