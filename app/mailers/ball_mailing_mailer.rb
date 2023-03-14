class BallMailingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ball_mailing_mailer.Mail.subject
  #
  def Mail
    @ball_mailing=BallMailing.find(params[:id])
    @user=User.find(params[:userid])
    attachments["ball_mailing.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/ball_mailing.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{ball_mailing:@ball_mailing,user:@user}
          )

         end
end
