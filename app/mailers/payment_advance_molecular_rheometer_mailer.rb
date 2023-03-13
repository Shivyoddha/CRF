class PaymentAdvanceMolecularRheometerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_advance_molecular_rheometer_mailer.Mail.subject
  #
  def Mail
    @advance_molecular_rheometer=AdvanceMolecularRheometer.find(params[:id])
    @user=User.find(params[:userid])
    attachments["Payment.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'payment_pdf/payment_xrd.html.erb', layout: 'pay.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Payment Details",
            locals:{advance_molecular_rheometer:@advance_molecular_rheometer,user:@user}
          )
  end
end
