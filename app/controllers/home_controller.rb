class HomeController < ApplicationController
  def verifsent
    @user = User.find(params[:id])
    FacultyVerifMailer.with(id:@user.id).verify.deliver_later
  end
  def maithu
    @user=User.find(params[:id])
    @user.update(status:'Active')
    @user.save
    redirect_to root_path
  end
  def faculty_verif
    @user=User.find(params[:id])
  end

  def index
      @user=User.find(current_user.id)
    if @user.status==nil
      redirect_to home_faculty_verif_path(id:current_user.id)
    end

    if @user.slotbooker == 'xrd'
    redirect_to slotbooker_xrd_path(current_user.id)
    end
    if @user.slotbooker == 'icp'
    redirect_to slotbooker_icp_path(current_user.id)
    end
    if @user.slotbooker == 'amr'
    redirect_to slotbooker_amr_path(current_user.id)
    end
    if @user.slotbooker == 'ionc'
    redirect_to slotbooker_ionc_path(current_user.id)
    end
    if @user.slotbooker == 'trib'
    redirect_to slotbooker_trib_path(current_user.id)
    end
    if @user.slotbooker == 'glow'
    redirect_to slotbooker_glow_path(current_user.id)
    end
    if @user.slotbooker == 'ball'
    redirect_to slotbooker_ball_path(current_user.id)
    end
    if @user.slotbooker == 'fric'
    redirect_to slotbooker_fric_path(current_user.id)
    end
    if @user.slotbooker == 'gait'
    redirect_to slotbooker_gait_path(current_user.id)
    end
    if @user.slotbooker == 'grind'
    redirect_to slotbooker_grind_path(current_user.id)
    end
    if @user.slotbooker == 'multi'
    redirect_to slotbooker_multi_path(current_user.id)
    end
    if @user.slotbooker == 'lcms'
    redirect_to slotbooker_lcms_path(current_user.id)
    end

   if @user.admin_role == true
    redirect_to rails_admin_path
   end


   respond_to do |format|
         format.html
         format.pdf do
           render pdf: "ShriRam",
                  template: "slot_mailer/milli_q_payment",
                  formats: [:html],
                  disposition: :inline,
                  layout: 'pdf'
         end
       end


  end
end
