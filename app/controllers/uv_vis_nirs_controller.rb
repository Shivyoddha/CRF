class UvVisNirsController < ApplicationController
  before_action :set_uv_vis_nir, only: %i[ show edit update destroy ]

  # GET /uv_vis_nirs or /uv_vis_nirs.json
  def index
    @uv_vis_nirs = UvVisNir.all
  end

  # GET /uv_vis_nirs/1 or /uv_vis_nirs/1.json
  def show
  end

  # GET /uv_vis_nirs/new
  def new
    @user=User.find(params[:id])
    @uv_vis_nir = UvVisNir.new
    @uv_vis_nir.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "UV-Vis-NIR").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "UV-Vis-NIR").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "UV-Vis-NIR").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /uv_vis_nirs/1/edit
  def edit
  end

  # POST /uv_vis_nirs or /uv_vis_nirs.json
  def create
    @uv_vis_nir = UvVisNir.new(uv_vis_nir_params)
    @uv_vis_nir.user=current_user
    @uv_vis_nir.status="pending"
    @uv_vis_nir.build_equipment_table
    if(@uv_vis_nir.entry_type== "manual")
    @uv_vis_nir.equipment_table.dummy = "proforma_confirmed"
    @uv_vis_nir.equipment_table.equipname = @uv_vis_nir.dummy1
    @uv_vis_nir.equipment_table.pay = @uv_vis_nir.amount
    @uv_vis_nir.equipment_table.username = @uv_vis_nir.dummy2
    @xrd.equipment_table.debit_head = @xrd.debit
    @uv_vis_nir.equipment_table.role = @uv_vis_nir.dummy3
    @uv_vis_nir.dummy2 = nil
    @uv_vis_nir.dummy3 = nil
  else
    @uv_vis_nir.equipment_table.dummy = "alloted"
    @uv_vis_nir.equipment_table.username = @uv_vis_nir.user.name
    @uv_vis_nir.equipment_table.equipname = "UV-Vis-NIR"
    @uv_vis_nir.equipment_table.app_no = @uv_vis_nir.id
    @uv_vis_nir.equipment_table.debit_head = @uv_vis_nir.debit
    @uv_vis_nir.equipment_table.role = @uv_vis_nir.user.role
    @uv_vis_nir.equipment_table.email = @uv_vis_nir.user.email
    @uv_vis_nir.equipment_table.dept = @uv_vis_nir.user.department
    @uv_vis_nir.equipment_table.profesion = @uv_vis_nir.user.profession
    @uv_vis_nir.equipment_table.orgname = @uv_vis_nir.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "UV-Vis-NIR").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @uv_vis_nir.save
        if  @uv_vis_nir.expresssample.present?
        equiplist = Equiplist.where(name: "UV-Vis-NIR").first
        equiplist.expressslot =equiplist.expressslot- @uv_vis_nir.expresssample
        equiplist.save
       end

        if @uv_vis_nir.user.role=='student'||@uv_vis_nir.user.role=='faculty'
          UvVisNirMailer.with(id:@uv_vis_nir.id, userid:current_user.id).InternalMail.deliver_later
        else
          UvVisNirMailer.with(id:@uv_vis_nir.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @uv_vis_nir.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "uv_vis_nir was successfully created." }
          format.json { render :show, status: :created, location: @uv_vis_nir }
      else
        format.html { redirect_to home_index_path, notice: "Uv vis nir was successfully created." }
        format.json { render :show, status: :created, location: @uv_vis_nir }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uv_vis_nir.errors, status: :unprocessable_entity }
      end
  end
end


  # PATCH/PUT /uv_vis_nirs/1 or /uv_vis_nirs/1.json
  def update
    @uv_vis_nir.status="alloted"
    @uv_vis_nir.build_equipment_table

    respond_to do |format|
      if @uv_vis_nir.update(uv_vis_nir_params)
        if @uv_vis_nir.status!= 'completed'
          UvVisNirAllotedMailer.with(id:@uv_vis_nir.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_uv_path(@uv_vis_nir), notice: "Uv vis nir was successfully updated." }
        format.json { render :show, status: :ok, location: @uv_vis_nir }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uv_vis_nir.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uv_vis_nirs/1 or /uv_vis_nirs/1.json
  def destroy
    @uv_vis_nir.destroy

    respond_to do |format|
      format.html { redirect_to uv_vis_nirs_url, notice: "Uv vis nir was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uv_vis_nir
      @uv_vis_nir = UvVisNir.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uv_vis_nir_params
      params.require(:uv_vis_nir).permit(:sample, :srange, :erange,  :composition, :toxicity, :sampletype, :more,:debit, :slotdate, :slottime, :status,:user_id, :entry_type,:dummy1,:dummy2,:dummy3,:amount,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],measurement: [],references: [])
    end
end
