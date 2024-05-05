class TrainingFormMailer < ApplicationMailer
      def form_filled
        @training=TrainingList.find(params[:training_id])
        @user=User.find(params[:userid])
        @model = "Training#{@training.id}"
        @presentmodel = @model.constantize
        @file_name = @training.name
        @response = @presentmodel.find(params[:present_id])
        attachments["TrainingSlotForm.pdf"] = WickedPdf.new.pdf_from_string(
        render_to_string(template: 'training_form_mailer/pdf_content.html.erb', layout: 'pdf.html.erb', pdf: "file_name")
        )

      mail(
            from:"crfnitk@gmail.com" ,

            to: "#{@user.email}",
            #cc: User.all.pluck(:email),
            #bcc: "ok@gmail",
            subject: "Training Slot Form filled",
            locals:{response:@response, user:  @user, training: @training}
            )

      end
end
