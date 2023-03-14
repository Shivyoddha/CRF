class AtomicForceMicroscopeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.atomic_force_microscope_mailer.Mail.subject
  #
  def Mail
    @atomic_force_microscope=AtomicForceMicroscope.find(params[:id])
    @user=User.find(params[:userid])
    attachments["atomiclotbooking.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/atomic_force_microscope.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{atomic_force_microscope:@atomic_force_microscope,user:@user}
          )
  end
end
