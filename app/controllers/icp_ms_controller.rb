class IcpMsController < ApplicationController
  before_action :set_icp_m, only: %i[ show edit update destroy ]

  # GET /icp_ms or /icp_ms.json
  def index
    @icp_ms = IcpM.all
  end

  # GET /icp_ms/1 or /icp_ms/1.json
  def show
  end

  # GET /icp_ms/new
  def new
    @icp_m = IcpM.new
  end

  # GET /icp_ms/1/edit
  def edit
  end

  # POST /icp_ms or /icp_ms.json
  def create
    @icp_m = IcpM.new(icp_m_params)

    respond_to do |format|
      if @icp_m.save
        format.html { redirect_to icp_m_url(@icp_m), notice: "Icp m was successfully created." }
        format.json { render :show, status: :created, location: @icp_m }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icp_m.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icp_ms/1 or /icp_ms/1.json
  def update
    respond_to do |format|
      if @icp_m.update(icp_m_params)
        format.html { redirect_to icp_m_url(@icp_m), notice: "Icp m was successfully updated." }
        format.json { render :show, status: :ok, location: @icp_m }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @icp_m.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icp_ms/1 or /icp_ms/1.json
  def destroy
    @icp_m.destroy

    respond_to do |format|
      format.html { redirect_to icp_ms_url, notice: "Icp m was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icp_m
      @icp_m = IcpM.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def icp_m_params
      params.require(:icp_m).permit(:sample, :composition, :sample_phase, :nature, :concentration, :testing, :storage, :toxicity, :compatibility, :hazard, :more)
    end
end
