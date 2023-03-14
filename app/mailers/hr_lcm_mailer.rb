class HrLcmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hr_lcm_mailer.Mail.subject
  #
  def Mail
    @hrlcm=Hrlcm.find(params[:id])
    @user=User.find(params[:userid])
    attachments["hrlcm.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/hr_lcm.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{hrlcm:@hrlcm,user:@user}
        )
  end
end
