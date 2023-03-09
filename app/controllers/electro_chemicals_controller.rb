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
    respond_to do |format|
      if @electro_chemical.save
        ElectroChemicalMailer.with(id:@electro_chemical.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to home_index_path, notice: "Electro chemical was successfully created." }
        format.json { render :show, status: :created, location: @electro_chemical }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @electro_chemical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electro_chemicals/1 or /electro_chemicals/1.json
  def update
      @electro_chemical.status="alloted"
      @electro_chemical.build_equipment_table
    respond_to do |format|
      if @electro_chemical.update(electro_chemical_params)
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
      params.require(:electro_chemical).permit(:sample, :composition, :electrolyte, :application, :more, :debit, :slotdate, :slottime, :status,:user_id,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay], references: [])
    end
end
