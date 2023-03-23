class ScratchIndentationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.scratch_indentation_mailer.Mail.subject
  #
  def InternalMail
    @scratch_indentation=ScratchIndentation.find(params[:id])
    @user=User.find(params[:userid])
    attachments["scratch_indentation.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/scratch_indentation.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{scratch_indentation:@scratch_indentation,user:@user}
        )
  end
  def ExternalMail
    @scratch_indentation=ScratchIndentation.find(params[:id])
    @user=User.find(params[:userid])
    attachments["scratch_indentation.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'slot_mailer/scratch_indentation.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
    )


      mail(
            from:"crfnitk@gmail.com" ,
            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "form submitted",
            locals:{scratch_indentation:@scratch_indentation,user:@user}
        )
  end

end
