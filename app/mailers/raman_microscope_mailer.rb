class RamanMicroscopeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.raman_microscope_mailer.Mail.subject
  #
  def Mail
    @raman_microscope=RamanMicroscope.find(params[:id])
    @user=User.find(params[:userid])
    attachments["raman_microscope.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/raman_microscope.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{raman_microscope:@raman_microscope,user:@user}
        )
  end
end
