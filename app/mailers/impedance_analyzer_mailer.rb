class ImpedanceAnalyzerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.impedance_analies_mailer.Mail.subject
  #
  def Mail
    @impedance_analies=ImpedanceAnaly.find(params[:id])
    @user=User.find(params[:userid])
    attachments["impedence_analyzer.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/impedence_analyzer.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
              to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{impedance_analies:@impedance_analies,user:@user}
        )
  end
end
