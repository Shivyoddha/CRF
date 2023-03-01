class IcpMMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.icp_m_mailer.Mail.subject
  #
  def Mail
    @icp_m=IcpM.find(params[:id])
    @user=User.find(params[:userid])
    attachments["icp_m.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/icp_m.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{icp_m:@icp_m,user:@user}
        )
  end
end
