class MultiImpactTesterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.multi_impact_tester_mailer.Mail.subject
  #
  def InternalMail
    @multi_impact_tester=MultiImpactTester.find(params[:id])
    @user=User.find(params[:userid])
    attachments["multi_impact_tester.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/multi_impact_tester.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{multi_impact_tester:@multi_impact_tester,user:@user}
        )
  end
  def ExternalMail
    @multi_impact_tester=MultiImpactTester.find(params[:id])
    @user=User.find(params[:userid])
    attachments["multi_impact_tester.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/multi_impact_tester.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{multi_impact_tester:@multi_impact_tester,user:@user}
        )
  end
end
