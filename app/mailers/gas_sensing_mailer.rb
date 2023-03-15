class GasSensingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gas_sensing_mailer.Mail.subject
  #
  def Mail
    @gas_sensing=GasSensing.find(params[:id])
    @user=User.find(params[:userid])
    attachments["gas_sensing.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/gas_sensing.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{gas_sensing:@gas_sensing,user:@user}
        )

  end
end
