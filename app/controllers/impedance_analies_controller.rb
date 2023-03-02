class ImpedanceAnaliesController < ApplicationController
  before_action :set_impedance_analy, only: %i[ show edit update destroy ]

  # GET /impedance_analies or /impedance_analies.json
  def index
    @impedance_analies = ImpedanceAnaly.all
  end

  # GET /impedance_analies/1 or /impedance_analies/1.json
  def show
  end

  # GET /impedance_analies/new
  def new
    @impedance_analy = ImpedanceAnaly.new
  end

  # GET /impedance_analies/1/edit
  def edit
  end

  # POST /impedance_analies or /impedance_analies.json
  def create
    @impedance_analy = ImpedanceAnaly.new(impedance_analy_params)
    @impedance_analy.user=current_user
    @impedance_analy.status="pending"
    respond_to do |format|
      if @impedance_analy.save
        ImpedanceAnalyzerMailer.with(id:@impedance_analy.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to impedance_analy_url(@impedance_analy), notice: "Impedance analy was successfully created." }
        format.json { render :show, status: :created, location: @impedance_analy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @impedance_analy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impedance_analies/1 or /impedance_analies/1.json
  def update
    respond_to do |format|
      if @impedance_analy.update(impedance_analy_params)
        format.html { redirect_to impedance_analy_url(@impedance_analy), notice: "Impedance analy was successfully updated." }
        format.json { render :show, status: :ok, location: @impedance_analy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @impedance_analy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impedance_analies/1 or /impedance_analies/1.json
  def destroy
    @impedance_analy.destroy

    respond_to do |format|
      format.html { redirect_to impedance_analies_url, notice: "Impedance analy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impedance_analy
      @impedance_analy = ImpedanceAnaly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def impedance_analy_params
      params.require(:impedance_analy).permit(:sample, :composition, :capacitance, :dielectric, :iv, :freqrange, :currentrange, :voltagerange, :impedance, :more, :debit, :slotdate, :slottime, :status,:losstangent,:user_id, references: [])
    end
end
