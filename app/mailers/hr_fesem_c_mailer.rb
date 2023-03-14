class HrFesemCMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hr_fesem_c_mailer.Mail.subject
  #
  def Mail
    @hr_fesem_c=HrFesemC.find(params[:id])
    @user=User.find(params[:userid])
    attachments["hr_fesem_c.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/hr_fesem_c.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{hr_fesem_c:@hr_fesem_c,user:@user}
        )
  end
end
