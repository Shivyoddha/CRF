class XRayDiffractionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.x_ray_diffraction_mailer.Mail.subject
  #
  def InternalMail
    @xrd=Xrd.find(params[:id])
    @user=User.find(params[:userid])
    attachments["xrdslotbooking.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/xrd.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Slot Form filled",
            locals:{xrd:@xrd,user:@user}
          )

  end
  def ExternalMail
    @xrd=Xrd.find(params[:id])
    @user=User.find(params[:userid])
    attachments["xrdslotbooking.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/xrd.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,

            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Slot Form filled",
            locals:{xrd:@xrd,user:@user}
          )

  end
  def ExternalMail
    @xrd=Xrd.find(params[:id])
    @user=User.find(params[:userid])
    attachments["xrdslotbooking.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/xrd.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,

            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Slot Form filled",
            locals:{xrd:@xrd,user:@user}
          )

  end

end
