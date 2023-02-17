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
    @uv_vis_nir = UvVisNir.new
  end

  # GET /uv_vis_nirs/1/edit
  def edit
  end

  # POST /uv_vis_nirs or /uv_vis_nirs.json
  def create
    @uv_vis_nir = UvVisNir.new(uv_vis_nir_params)

    respond_to do |format|
      if @uv_vis_nir.save
        format.html { redirect_to uv_vis_nir_url(@uv_vis_nir), notice: "Uv vis nir was successfully created." }
        format.json { render :show, status: :created, location: @uv_vis_nir }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uv_vis_nir.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uv_vis_nirs/1 or /uv_vis_nirs/1.json
  def update
    respond_to do |format|
      if @uv_vis_nir.update(uv_vis_nir_params)
        format.html { redirect_to uv_vis_nir_url(@uv_vis_nir), notice: "Uv vis nir was successfully updated." }
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
      params.require(:uv_vis_nir).permit(:sample, :srange, :erange, :measurement, :composition, :toxicity, :sampletype, :more)
    end
end
