class MilliQMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.milli_q_mailer.Mail.subject
  #
  def InternalMail
    @milli_q=MilliQ.find(params[:id])
    @user=User.find(params[:userid])
    # attachments["milli_q.pdf"] = WickedPdf.new.pdf_from_string(
    # render_to_string(template: 'slot_mailer/milli_q.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    # )
    # attachments["milli_q_payment.pdf"] = WickedPdf.new.pdf_from_string(
    # render_to_string(template: 'slot_mailer/milli_q_payment.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    # )
    attachments["milli_q.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/milli_q.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )
    attachments["milli_q_payment.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/milli_q_payment.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "bangaloreameen@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{milli_q:@milli_q,user:@user}
        )
  end
  def ExternalMail
    @milli_q=MilliQ.find(params[:id])
    @user=User.find(params[:userid])
    # attachments["milli_q.pdf"] = WickedPdf.new.pdf_from_string(
    # render_to_string(template: 'slot_mailer/milli_q.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    # )
    # attachments["milli_q_payment.pdf"] = WickedPdf.new.pdf_from_string(
    # render_to_string(template: 'slot_mailer/milli_q_payment.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    # )
    attachments["milli_q.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/milli_q.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )
    attachments["milli_q_payment.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/milli_q_payment.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "bangaloreameen@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{milli_q:@milli_q,user:@user}
        )
  end
end
