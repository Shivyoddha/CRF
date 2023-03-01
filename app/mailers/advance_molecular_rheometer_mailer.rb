class AdvanceMolecularRheometerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.advance_molecular_rheometer_mailer.mail.subject
  #
  def Mail
    @advance_molecular_rheometer=AdvanceMolecularRheometer.find(params[:id])
    @user=User.find(params[:userid])
    attachments["advanceslotbooking.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/advance_molecular_rheometer.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{advance_molecular_rheometer:@advance_molecular_rheometer,user:@user}
          )
  end
end
