class IonChromotographyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ion_chromotography_mailer.Mail.subject
  #
  def Mail
    @ion_chromotography=IonChromotography.find(params[:id])
    @user=User.find(params[:userid])
    attachments["ion_chromotography.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/ion_chromotography.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{ion_chromotography:@ion_chromotography,user:@user}
        )
  end
end
