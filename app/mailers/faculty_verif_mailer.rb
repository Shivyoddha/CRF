class FacultyVerifMailer < ApplicationMailer
  default :from => "crfnitk@gmail.com"

  def verify
    @user=User.find(params[:id])
    mail(
          from:"crfnitk@gmail.com" ,

          to: "#{@user.faculty.email}",
          #cc: User.all.pluck(:email),
          #bcc: "ok@gmail",
          subject: "Verficiation for faculty"

        )
  end
end
