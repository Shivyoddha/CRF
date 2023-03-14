class CellImagingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cell_imaging_mailer.Mail.subject
  #
  def Mail
    @cell_imaging=CellImaging.find(params[:id])
    @user=User.find(params[:userid])
    attachments["cell_imaging.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/cell_imaging.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{cell_imaging:@cell_imaging,user:@user}
          )

         end
end
