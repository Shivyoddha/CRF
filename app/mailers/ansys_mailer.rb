class AnsysMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ansys_mailer.mail.subject
  #
  def Mail
    @ansy=Ansy.find(params[:id])
    @user=User.find(params[:userid])
    attachments["ansys.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/ansy.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )
     attachments["ansys_payment.pdf"] = WickedPdf.new.pdf_from_string(
     render_to_string(template: 'slot_mailer/ansy_payment.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
     )
      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            # to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Slot Alloted",
             locals:{ansy:@ansy,user:@user}
          )
  end
end
