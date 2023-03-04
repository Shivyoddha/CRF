class GasSensingsController < ApplicationController
  before_action :set_gas_sensing, only: %i[ show edit update destroy ]

  # GET /gas_sensings or /gas_sensings.json
  def index
    @gas_sensings = GasSensing.all
  end

  # GET /gas_sensings/1 or /gas_sensings/1.json
  def show
  end

  # GET /gas_sensings/new
  def new
    @gas_sensing = GasSensing.new
  end

  # GET /gas_sensings/1/edit
  def edit
  end

  # POST /gas_sensings or /gas_sensings.json
  def create
    @gas_sensing = GasSensing.new(gas_sensing_params)
    @gas_sensing.user=current_user
    @gas_sensing.status="pending"
    respond_to do |format|
      if @gas_sensing.save
        GasSensingMailer.with(id:@gas_sensing.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to gas_sensing_url(@gas_sensing), notice: "Gas sensing was successfully created." }
        format.json { render :show, status: :created, location: @gas_sensing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gas_sensing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gas_sensings/1 or /gas_sensings/1.json
  def update
    @gas_sensing.status="alloted"
    respond_to do |format|
      if @gas_sensing.update(gas_sensing_params)
        format.html { redirect_to slotbooker_gassensing_path(@gas_sensing), notice: "Gas sensing was successfully updated." }
        format.json { render :show, status: :ok, location: @gas_sensing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gas_sensing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gas_sensings/1 or /gas_sensings/1.json
  def destroy
    @gas_sensing.destroy

    respond_to do |format|
      format.html { redirect_to gas_sensings_url, notice: "Gas sensing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gas_sensing
      @gas_sensing = GasSensing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gas_sensing_params
      params.require(:gas_sensing).permit(:sample, :gas, :toxicity, :compatibility, :carcinogenic, :more, :debit, :slotdate, :slottime, :status,:user_id, references: [])
    end
end
