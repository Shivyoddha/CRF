class ThreeDNonContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.three_d_non_contact_mailer.Mail.subject
  #
  def Mail
    @three_d_non_contact=ThreeDNonContact.find(params[:id])
    @user=User.find(params[:userid])
    attachments["three_d_non_contact.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/three_d_non_contact.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{three_d_non_contact:@three_d_non_contact,user:@user}
        )
  end
end
