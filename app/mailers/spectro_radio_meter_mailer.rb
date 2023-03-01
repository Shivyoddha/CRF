class SpectroRadioMeterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.spectro_radio_meter_mailer.Mail.subject
  #
  def Mail
    @spectro_radio_meter=SpectroRadioMeter.find(params[:id])
    @user=User.find(params[:userid])
    attachments["spectro_radio_meter.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/spectro_radio_meter.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{spectro_radio_meter:@spectro_radio_meter,user:@user}
        )
  end
end
