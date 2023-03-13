class HighTempVaccumsController < ApplicationController
  before_action :set_high_temp_vaccum, only: %i[ show edit update destroy ]

  # GET /high_temp_vaccums or /high_temp_vaccums.json
  def index
    @high_temp_vaccums = HighTempVaccum.all
  end

  # GET /high_temp_vaccums/1 or /high_temp_vaccums/1.json
  def show
  end

  # GET /high_temp_vaccums/new
  def new
    @high_temp_vaccum = HighTempVaccum.new
    @high_temp_vaccum.build_equipment_table

  end

  # GET /high_temp_vaccums/1/edit
  def edit
  end

  # POST /high_temp_vaccums or /high_temp_vaccums.json
  def create
    @high_temp_vaccum = HighTempVaccum.new(high_temp_vaccum_params)
    @high_temp_vaccum.user=current_user
    @high_temp_vaccum.status="pending"
    @high_temp_vaccum.build_equipment_table
    respond_to do |format|
      if @high_temp_vaccum.save
        HighTempVaccumMailer.with(id:@high_temp_vaccum.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to high_temp_vaccum_url(@high_temp_vaccum), notice: "High temp vaccum was successfully created." }
        format.json { render :show, status: :created, location: @high_temp_vaccum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @high_temp_vaccum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /high_temp_vaccums/1 or /high_temp_vaccums/1.json
  def update
    @high_temp_vaccum.status="alloted"
    @high_temp_vaccum.build_equipment_table
    respond_to do |format|
      if @high_temp_vaccum.update(high_temp_vaccum_params)
        HighTempVaccumAllotedMailer.with(id:@high_temp_vaccum.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_highvaccum_path(@high_temp_vaccum), notice: "High temp vaccum was successfully updated." }
        format.json { render :show, status: :ok, location: @high_temp_vaccum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @high_temp_vaccum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /high_temp_vaccums/1 or /high_temp_vaccums/1.json
  def destroy
    @high_temp_vaccum.destroy

    respond_to do |format|
      format.html { redirect_to high_temp_vaccums_url, notice: "High temp vaccum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_high_temp_vaccum
      @high_temp_vaccum = HighTempVaccum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def high_temp_vaccum_params
      params.require(:high_temp_vaccum).permit(:sample, :composition, :toxicity, :req_atoms, :gas, :starttemp, :endtemp, :samplemelting, :no_steps, :temp1, :min1, :temp2, :min2, :temp3, :min3, :temp4, :min4, :temp5, :min5, :more, :debit, :slotdate, :slottime, :status,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email] , references: [])
    end
end
