class GaitMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gait_mailer.Mail.subject
  #
  def Mail
    @gait=Gait.find(params[:id])
    @user=User.find(params[:userid])
    attachments["gait.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/gait.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{gait:@gait,user:@user}
          )
  end
end
