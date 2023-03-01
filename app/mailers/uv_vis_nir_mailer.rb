class UvVisNirMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.uv_vis_nir_mailer.Mail.subject
  #
  def Mail
    @uv_vis_nir=UvVisNir.find(params[:id])
    @user=User.find(params[:userid])
    attachments["uv_vis_nir.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/uv_vis_nir.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{uv_vis_nir:@uv_vis_nir,user:@user}
        )
  end
end
