class FtNmrsController < ApplicationController
  before_action :set_ft_nmr, only: %i[ show edit update destroy ]

  # GET /ft_nmrs or /ft_nmrs.json
  def index
    @ft_nmrs = FtNmr.all
  end

  # GET /ft_nmrs/1 or /ft_nmrs/1.json
  def show
  end

  # GET /ft_nmrs/new
  def new
    @ft_nmr = FtNmr.new
  end

  # GET /ft_nmrs/1/edit
  def edit
  end

  # POST /ft_nmrs or /ft_nmrs.json
  def create
    @ft_nmr = FtNmr.new(ft_nmr_params)

    respond_to do |format|
      if @ft_nmr.save
        format.html { redirect_to ft_nmr_url(@ft_nmr), notice: "Ft nmr was successfully created." }
        format.json { render :show, status: :created, location: @ft_nmr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ft_nmr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ft_nmrs/1 or /ft_nmrs/1.json
  def update
    respond_to do |format|
      if @ft_nmr.update(ft_nmr_params)
        format.html { redirect_to ft_nmr_url(@ft_nmr), notice: "Ft nmr was successfully updated." }
        format.json { render :show, status: :ok, location: @ft_nmr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ft_nmr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ft_nmrs/1 or /ft_nmrs/1.json
  def destroy
    @ft_nmr.destroy

    respond_to do |format|
      format.html { redirect_to ft_nmrs_url, notice: "Ft nmr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ft_nmr
      @ft_nmr = FtNmr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ft_nmr_params
      params.require(:ft_nmr).permit(:sample, :sample_nature, :sample_phase, :toxicity, :health, :storage, :more)
    end
end
