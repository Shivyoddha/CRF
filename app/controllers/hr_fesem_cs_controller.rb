class HrFesemCsController < ApplicationController
  before_action :set_hr_fesem_c, only: %i[ show edit update destroy ]

  # GET /hr_fesem_cs or /hr_fesem_cs.json
  def index
    @hr_fesem_cs = HrFesemC.all
  end

  # GET /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def show
  end

  # GET /hr_fesem_cs/new
  def new
    @hr_fesem_c = HrFesemC.new
  end

  # GET /hr_fesem_cs/1/edit
  def edit
  end

  # POST /hr_fesem_cs or /hr_fesem_cs.json
  def create
    @hr_fesem_c = HrFesemC.new(hr_fesem_c_params)

    respond_to do |format|
      if @hr_fesem_c.save
        format.html { redirect_to hr_fesem_c_url(@hr_fesem_c), notice: "Hr fesem c was successfully created." }
        format.json { render :show, status: :created, location: @hr_fesem_c }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hr_fesem_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def update
    respond_to do |format|
      if @hr_fesem_c.update(hr_fesem_c_params)
        format.html { redirect_to hr_fesem_c_url(@hr_fesem_c), notice: "Hr fesem c was successfully updated." }
        format.json { render :show, status: :ok, location: @hr_fesem_c }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hr_fesem_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def destroy
    @hr_fesem_c.destroy

    respond_to do |format|
      format.html { redirect_to hr_fesem_cs_url, notice: "Hr fesem c was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hr_fesem_c
      @hr_fesem_c = HrFesemC.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hr_fesem_c_params
      params.require(:hr_fesem_c).permit(:sample, :composition, :stype, :sphase, :measurement, :eds_required, :toxic, :conducting, :more)
    end
end
