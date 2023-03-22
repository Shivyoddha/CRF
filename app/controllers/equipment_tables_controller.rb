class EquipmentTablesController < ApplicationController
  before_action :set_equipment_table, only: %i[ show edit update destroy ]

  # GET /equipment_tables or /equipment_tables.json
  def index
    @equipment_tables = EquipmentTable.all
  end

  # GET /equipment_tables/1 or /equipment_tables/1.json
  def show
  end

  # GET /equipment_tables/new
  def new
    @equipment_table = EquipmentTable.new
  end

  # GET /equipment_tables/1/edit
  def edit
  end

  # POST /equipment_tables or /equipment_tables.json
  def create
    @equipment_table = EquipmentTable.new(equipment_table_params)

    respond_to do |format|
      if @equipment_table.save
        if @equipment_table.user.role=='student'||@equipment_table.user.role=='faculty'
          EquipmentTableMailer.with(id:@equipment_table.id, userid:current_user.id).InternalMail.deliver_later
        else
          EquipmentTableMailer.with(id:@equipment_table.id, userid:current_user.id).ExternalMail.deliver_later
        end 
        format.html { redirect_to equipment_table_url(@equipment_table), notice: "Equipment table was successfully created." }
        format.json { render :show, status: :created, location: @equipment_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_tables/1 or /equipment_tables/1.json
  def update
    respond_to do |format|
      if @equipment_table.update(equipment_table_params)
        format.html { redirect_to payment_payment_path(@equipment_table), notice: "Equipment table was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_tables/1 or /equipment_tables/1.json
  def destroy
    @equipment_table.destroy

    respond_to do |format|
      format.html { redirect_to equipment_tables_url, notice: "Equipment table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_table
      @equipment_table = EquipmentTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_table_params
      params.require(:equipment_table).permit(:username, :equipname, :app_no, :pay, :debit_head, :slotd, :slott, :dummy)
    end
end
