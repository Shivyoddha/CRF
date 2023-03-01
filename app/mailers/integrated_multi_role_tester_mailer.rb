class IntegratedMultiRoleTesterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.integrated_multi_role_tester_mailer.Mail.subject
  #
  def Mail
    @integrated_multi_role_tester=IntegratedMultiRoleTester.find(params[:id])
    @user=User.find(params[:userid])
    attachments["integrated_multi_role_tester.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/integrated_multi_role_tester.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "nikeshs129@gmail.com",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{integrated_multi_role_tester:@integrated_multi_role_tester,user:@user}
        )
  end
end
