class HrlcmsController < ApplicationController
  before_action :set_hrlcm, only: %i[ show edit update destroy ]

  # GET /hrlcms or /hrlcms.json
  def index
    @hrlcms = Hrlcm.all
  end

  # GET /hrlcms/1 or /hrlcms/1.json
  def show
  end

  # GET /hrlcms/new
  def new
    @hrlcm = Hrlcm.new
    @user=User.find(params[:id])
    @hrlcm.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "HR-LCMS").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "HR-LCMS").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "HR-LCMS").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /hrlcms/1/edit
  def edit
  end

  # POST /hrlcms or /hrlcms.json
  def create
    @hrlcm = Hrlcm.new(hrlcm_params)
    @hrlcm.user=current_user
    @hrlcm.status="pending"
    @hrlcm.build_equipment_table
    if(@hrlcm.entry_type== "manual")
      @hrlcm.equipment_table.dummy = "proforma_confirmed"
      @hrlcm.equipment_table.equipname = @hrlcm.dummy1
      @hrlcm.equipment_table.pay = @hrlcm.amount
      @hrlcm.equipment_table.username = @hrlcm.dummy2
      @hrlcm.equipment_table.debit_head = @hrlcm.debit
      @hrlcm.equipment_table.role = @hrlcm.dummy3
      @hrlcm.dummy2 = nil
      @hrlcm.dummy3 = nil
    else
      @hrlcm.equipment_table.sample = @hrlcm.sample
    @hrlcm.equipment_table.contact_no = @hrlcm.user.contact
    uploaded_files = params[:hrlcm][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @hrlcm.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @hrlcm.equipment_table.dummy = "alloted"
    @hrlcm.equipment_table.username = @hrlcm.user.name
    @hrlcm.equipment_table.equipname = "HR-LCMS"
    @hrlcm.equipment_table.app_no = @hrlcm.id
    @hrlcm.equipment_table.debit_head = @hrlcm.debit
    @hrlcm.equipment_table.role = @hrlcm.user.role
    @hrlcm.equipment_table.email = @hrlcm.user.email
    @hrlcm.equipment_table.dept = @hrlcm.user.department
    @hrlcm.equipment_table.profesion = @hrlcm.user.profession
    @hrlcm.equipment_table.orgname = @hrlcm.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "HR-LCMS").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @hrlcm.save
        if  @hrlcm.expresssample.present?
         equiplist = Equiplist.where(name: "HR-LCMS").first
         equiplist.expressslot =equiplist.expressslot- @hrlcm.expresssample
         equiplist.save
        end
        if @hrlcm.user.role=='student'||@hrlcm.user.role=='faculty'
          HrLcmMailer.with(id:@hrlcm.id, userid:current_user.id).InternalMail.deliver_later
        else
          HrLcmMailer.with(id:@hrlcm.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @hrlcm.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "hrlcm was successfully created." }
            format.json { render :show, status: :created, location: @hrlcm }
        else
        format.html { redirect_to  home_index_path, notice: "Hrlcm was successfully created." }
        format.json { render :show, status: :created, location: @hrlcm }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hrlcm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hrlcms/1 or /hrlcms/1.json
  def update
    @hrlcm.status="alloted"

    respond_to do |format|
      if @hrlcm.update(hrlcm_params)
        if @hrlcm.status!= 'completed'
          HrlcmAllotedMailer.with(id:@hrlcm.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_lcms_path(@hrlcm), notice: "Hrlcm was successfully updated." }
        format.json { render :show, status: :ok, location: @hrlcm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hrlcm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hrlcms/1 or /hrlcms/1.json
  def destroy
    @hrlcm.destroy

    respond_to do |format|
      format.html { redirect_to hrlcms_url, notice: "Hrlcm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hrlcm
      @hrlcm = Hrlcm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hrlcm_params
      params.require(:hrlcm).permit(:sample, :nature_sample, :category, :sample_type, :solvent, :analysis, :sample_volume, :sample_concentration, :sample_salts, :sample_contains, :storage , :incompatible, :toxicity,:health,  :disposal, :more, :testing_required, :status, :slotdate, :slottime, :debit,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,] ,hazard_method: [], testing_required: [], references: [])
    end
end
