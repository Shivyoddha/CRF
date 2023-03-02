class HighTempVaccumMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.high_temp_vaccum_mailer.Mail.subject
  #
  def Mail
    @high_temp_vaccum=HighTempVaccum.find(params[:id])
    @user=User.find(params[:userid])
    attachments["high_temp_vaccum.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/high_temp_vaccum.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{high_temp_vaccum:@high_temp_vaccum,user:@user}
        )
  end
end
