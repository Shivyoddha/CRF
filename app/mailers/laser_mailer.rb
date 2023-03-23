class LaserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.laser_mailer.Mail.subject
  #
  def InternalMail
    @laser=Laser.find(params[:id])
    @user=User.find(params[:userid])
    attachments["laser.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/laser.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{laser:@ion_chromotography,user:@user}
        )

  end
  def ExternalMail
    @laser=Laser.find(params[:id])
    @user=User.find(params[:userid])
    attachments["laser.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/laser.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{laser:@ion_chromotography,user:@user}
        )

  end
end
