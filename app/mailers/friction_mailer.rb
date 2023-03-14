class FrictionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.friction_mailer.Mail.subject
  #
  def Mail
    @friction=Friction.find(params[:id])
    @user=User.find(params[:userid])
    attachments["friction.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/friction.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{friction:@friction,user:@user}
          )
  end
end
