class MicroEdmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.micro_edm_mailer.Mail.subject
  #
  def Mail
    @micro_edm=MicroEdm.find(params[:id])
    @user=User.find(params[:userid])
    attachments["micro_edm.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/micro_edm.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{micro_edm:@micro_edm,user:@user}
        )
  end
end
