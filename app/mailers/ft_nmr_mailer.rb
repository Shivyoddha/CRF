class FtNmrMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ft_nmr_mailer.Mail.subject
  #
  def Mail
    @ftnmr=FtNm.find(params[:id])
    @user=User.find(params[:userid])
    attachments["Ftnmr.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/ftnmr.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{ft_nm:@ftnmr,user:@user}
          )
  end
end
