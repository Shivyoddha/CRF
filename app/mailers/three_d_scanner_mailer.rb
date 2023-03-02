class ThreeDScannerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.three_d_scanner_mailer.Mail.subject
  #
  def Mail
    @three_d_scanner=ThreeDScanner.find(params[:id])
    @user=User.find(params[:userid])
    attachments["three_d_scanner.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/three_d_scanner.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{three_d_scanner:@three_d_scanner,user:@user}
        )
  end
end
