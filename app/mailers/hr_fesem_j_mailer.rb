class HrFesemJMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hr_fesem_j_mailer.Mail.subject
  #
  def InternalMail
    @hr_fesem_j=HrFesemJ.find(params[:id])
    @user=User.find(params[:userid])
    attachments["hr_fesem_j.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/hr_fesem_j.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{hr_fesem_j:@hr_fesem_j,user:@user}
        )

  end
  def ExternalMail
    @hr_fesem_j=HrFesemJ.find(params[:id])
    @user=User.find(params[:userid])
    attachments["hr_fesem_j.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/hr_fesem_j.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{hr_fesem_j:@hr_fesem_j,user:@user}
        )

  end
end
