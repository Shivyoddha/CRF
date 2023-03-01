class BetMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bet_mailer.Mail.subject
  #
  def Mail
    @bet=Bet.find(params[:id])
    @user=User.find(params[:userid])
    attachments["bet.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/bet.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{ball_mailing:@bet,user:@user}
          )

  end
end
