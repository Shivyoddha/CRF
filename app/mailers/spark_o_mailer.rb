class SparkOMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.spark_o_mailer.Mail.subject
  #
  def Mail
    @spark_o=SparkO.find(params[:id])
    @user=User.find(params[:userid])
    attachments["spark_o.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/spark_o.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{spark_o:@spark_o,user:@user}
        )
  end
end
