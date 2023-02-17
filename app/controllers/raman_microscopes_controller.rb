class RamanMicroscopesController < ApplicationController
  before_action :set_raman_microscope, only: %i[ show edit update destroy ]

  # GET /raman_microscopes or /raman_microscopes.json
  def index
    @raman_microscopes = RamanMicroscope.all
  end

  # GET /raman_microscopes/1 or /raman_microscopes/1.json
  def show
  end

  # GET /raman_microscopes/new
  def new
    @raman_microscope = RamanMicroscope.new
  end

  # GET /raman_microscopes/1/edit
  def edit
  end

  # POST /raman_microscopes or /raman_microscopes.json
  def create
    @raman_microscope = RamanMicroscope.new(raman_microscope_params)

    respond_to do |format|
      if @raman_microscope.save
        format.html { redirect_to raman_microscope_url(@raman_microscope), notice: "Raman microscope was successfully created." }
        format.json { render :show, status: :created, location: @raman_microscope }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @raman_microscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raman_microscopes/1 or /raman_microscopes/1.json
  def update
    respond_to do |format|
      if @raman_microscope.update(raman_microscope_params)
        format.html { redirect_to raman_microscope_url(@raman_microscope), notice: "Raman microscope was successfully updated." }
        format.json { render :show, status: :ok, location: @raman_microscope }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @raman_microscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raman_microscopes/1 or /raman_microscopes/1.json
  def destroy
    @raman_microscope.destroy

    respond_to do |format|
      format.html { redirect_to raman_microscopes_url, notice: "Raman microscope was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raman_microscope
      @raman_microscope = RamanMicroscope.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raman_microscope_params
      params.require(:raman_microscope).permit(:sample, :measurement, :stype, :description, :toxicity, :Compatability, :carcinogenic, :more)
    end
end
