class ProbeSonicatorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.probe_sonicator_mailer.Mail.subject
  #
  def InternalMail
    @probe_sonicator=ProbeSonicator.find(params[:id])
    @user=User.find(params[:userid])
    attachments["probe_sonicator.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/probe_sonicator.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{probe_sonicator:@probe_sonicator,user:@user}
        )
  end
  def ExternalMail
    @probe_sonicator=ProbeSonicator.find(params[:id])
    @user=User.find(params[:userid])
    attachments["probe_sonicator.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/probe_sonicator.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{probe_sonicator:@probe_sonicator,user:@user}
        )
  end
end
