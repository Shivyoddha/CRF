class ElectroChemicalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.electro_chemical_mailer.Mail.subject
  #
  def Mail
    @electro_chemical=ElectroChemical.find(params[:id])
    @user=User.find(params[:userid])
    attachments["electro_chemical.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/electro_chemical.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{electro_chemical:@electro_chemical,user:@user}
          )
  end
end
