class FeedbackMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback_mailer.mail.subject
  #
  default :from => "crfnitk@gmail.com"

  def Mail
    @user=User.find(params[:userid])
    mail(
          from:"crfnitk@gmail.com" ,

          to: "#{@user.email}",
          #cc: User.all.pluck(:email),
          #bcc: "ok@gmail",
          subject: "Please provide your valuable feedback"

        )
  end
end
