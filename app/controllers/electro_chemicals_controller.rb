class ElectroChemicalsController < ApplicationController
  before_action :set_electro_chemical, only: %i[ show edit update destroy ]

  # GET /electro_chemicals or /electro_chemicals.json
  def index
    @electro_chemicals = ElectroChemical.all
  end

  # GET /electro_chemicals/1 or /electro_chemicals/1.json
  def show
  end

  # GET /electro_chemicals/new
  def new
    @electro_chemical = ElectroChemical.new
    @electro_chemical.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Electro Chemical Polishing").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Electro Chemical Polishing").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Electro Chemical Polishing").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /electro_chemicals/1/edit
  def edit
  end

  # POST /electro_chemicals or /electro_chemicals.json
  def create
    @electro_chemical = ElectroChemical.new(electro_chemical_params)
    @electro_chemical.user=current_user
    @electro_chemical.status="pending"
    @electro_chemical.build_equipment_table
    if(@electro_chemical.entry_type== "manual")
      @electro_chemical.equipment_table.dummy = "proforma_confirmed"
      @electro_chemical.equipment_table.equipname = @electro_chemical.dummy1
      @electro_chemical.equipment_table.pay = @electro_chemical.amount
      @electro_chemical.equipment_table.username = @electro_chemical.dummy2
      @electro_chemical.equipment_table.debit_head = @electro_chemical.debit
      @electro_chemical.equipment_table.role = @electro_chemical.dummy3
      @electro_chemical.dummy2 = nil
      @electro_chemical.dummy3 = nil
    else
      @electro_chemical.equipment_table.sample = @electro_chemical.sample
    @electro_chemical.equipment_table.contact_no = @electro_chemical.user.contact
    uploaded_files = params[:electro_chemical][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @electro_chemical.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @electro_chemical.equipment_table.dummy = "alloted"
    @electro_chemical.equipment_table.username = @electro_chemical.user.name
    @electro_chemical.equipment_table.equipname = "Electro Chemical Polishing"
    @electro_chemical.equipment_table.app_no = @electro_chemical.id
    @electro_chemical.equipment_table.debit_head = @electro_chemical.debit
    @electro_chemical.equipment_table.role = @electro_chemical.user.role
    @electro_chemical.equipment_table.email = @electro_chemical.user.email
    @electro_chemical.equipment_table.dept = @electro_chemical.user.department
    @electro_chemical.equipment_table.profesion = @electro_chemical.user.profession
    @electro_chemical.equipment_table.orgname = @electro_chemical.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Electro Chemical Polishing").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @electro_chemical.save
        if  @electro_chemical.expresssample.present?
        equiplist = Equiplist.where(name: "Electro Chemical Polishing").first
        equiplist.expressslot =equiplist.expressslot- @electro_chemical.expresssample
        equiplist.save
       end
        if @electro_chemical.user.role=='student'||@electro_chemical.user.role=='faculty'
          ElectroChemicalMailer.with(id:@electro_chemical.id, userid:current_user.id).InternalMail.deliver_later
        else
          ElectroChemicalMailer.with(id:@electro_chemical.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @electro_chemical.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "electro_chemical was successfully created." }
            format.json { render :show, status: :created, location: @electro_chemical }
        else
        format.html { redirect_to home_index_path, notice: "Electro chemical was successfully created." }
        format.json { render :show, status: :created, location: @electro_chemical }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @electro_chemical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electro_chemicals/1 or /electro_chemicals/1.json
  def update
      @electro_chemical.status="alloted"
    respond_to do |format|
      if @electro_chemical.update(electro_chemical_params)
        if @electro_chemical.status!= 'completed'
          ElectroChemicalAllotedMailer.with(id:@electro_chemical.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_elctro_path(@electro_chemical), notice: "Electro chemical was successfully updated." }
        format.json { render :show, status: :ok, location: @electro_chemical }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @electro_chemical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electro_chemicals/1 or /electro_chemicals/1.json
  def destroy
    @electro_chemical.destroy

    respond_to do |format|
      format.html { redirect_to electro_chemicals_url, notice: "Electro chemical was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electro_chemical
      @electro_chemical = ElectroChemical.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def electro_chemical_params
      params.require(:electro_chemical).permit(:sample, :composition, :electrolyte, :application, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type, :amount, :dummy1,:dummy2,:dummy3,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
