class ZetaPotentialSizeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zeta_potential_size_mailer.Mail.subject
  #
  def Mail
    @zeta_potential_size=ZetaPotentialSize.find(params[:id])
    @user=User.find(params[:userid])
    attachments["zeta_potential_size.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/zeta_potential_size.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{zeta_potential_size:@zeta_potential_size,user:@user}
        )
  end
end
