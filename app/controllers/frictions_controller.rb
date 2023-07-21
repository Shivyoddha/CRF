class FrictionsController < ApplicationController
  before_action :set_friction, only: %i[ show edit update destroy ]

  # GET /frictions or /frictions.json
  def index
    @frictions = Friction.all
  end

  # GET /frictions/1 or /frictions/1.json
  def show
  end

  # GET /frictions/new
  def new
    @friction = Friction.new
    @user=User.find(params[:id])
    @friction.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Friction Stir Welding/Surfacing(FSW)").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Friction Stir Welding/Surfacing(FSW)").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Friction Stir Welding/Surfacing(FSW)").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /frictions/1/edit
  def edit
  end

  # POST /frictions or /frictions.json
  def create
    @friction = Friction.new(friction_params)
    @friction.user=current_user
    @friction.status="pending"
    @friction.build_equipment_table
    if(@friction.entry_type== "manual")
      @friction.equipment_table.dummy = "proforma_confirmed"
      @friction.equipment_table.equipname = @friction.dummy1
      @friction.equipment_table.pay = @friction.amount
      @friction.equipment_table.username = @friction.dummy2
      @friction.equipment_table.debit_head = @Friction.debit
      @friction.equipment_table.role = @friction.dummy3
      @friction.dummy2 = nil
      @friction.dummy3 = nil
    else
      @friction.equipment_table.sample = @friction.sample
    @friction.equipment_table.contact_no = @friction.user.contact
    uploaded_files = params[:friction][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @friction.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @friction.equipment_table.dummy = "alloted"
    @friction.equipment_table.username = @friction.user.name
    @friction.equipment_table.equipname = "Friction Stir Welding/Surfacing(FSW)"
    @friction.equipment_table.debit_head = @friction.debit
    @friction.equipment_table.role = @friction.user.role
    @friction.equipment_table.email = @friction.user.email
    @friction.equipment_table.dept = @friction.user.department
    @friction.equipment_table.profesion = @friction.user.profession
    @friction.equipment_table.orgname = @friction.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Friction Stir Welding/Surfacing(FSW)").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @friction.save
        if  @friction.expresssample.present?
         equiplist = Equiplist.where(name: "Friction Stir Welding/Surfacing(FSW)").first
         equiplist.expressslot =equiplist.expressslot- @friction.expresssample
         equiplist.save
        end
        if @friction.user.role=='student'||@friction.user.role=='faculty'
          FrictionMailer.with(id:@friction.id, userid:current_user.id).InternalMail.deliver_later
        else
          FrictionMailer.with(id:@friction.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @friction.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "friction was successfully created." }
            format.json { render :show, status: :created, location: @friction }
        else
        format.html { redirect_to home_index_path, notice: "Friction was successfully created." }
        format.json { render :show, status: :created, location: @friction }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frictions/1 or /frictions/1.json
  def update
      @friction.status="alloted"
    respond_to do |format|
      if @friction.update(friction_params)
        if @friction.status!= 'completed'
          FrictionAllotedMailer.with(id:@friction.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_fric_path(@friction), notice: "Friction was successfully updated." }
        format.json { render :show, status: :ok, location: @friction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frictions/1 or /frictions/1.json
  def destroy
    @friction.destroy

    respond_to do |format|
      format.html { redirect_to frictions_url, notice: "Friction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friction
      @friction = Friction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friction_params
      params.require(:friction).permit(:sample, :material, :pstype, :tool, :toolnom, :rspeed, :wspeed, :otforce, :wtemp,:temp, :measurement, :depth, :ptforce, :more, :status, :slotdate, :slottime, :debit,:user_id,:entry_type, :amount, :dummy1,:dummy2,:dummy3,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] ,material: [], references: [])
    end
end
