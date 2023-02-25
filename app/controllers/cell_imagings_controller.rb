class CellImagingsController < ApplicationController
  before_action :set_cell_imaging, only: %i[ show edit update destroy ]

  # GET /cell_imagings or /cell_imagings.json
  def index
    @cell_imagings = CellImaging.all
  end

  # GET /cell_imagings/1 or /cell_imagings/1.json
  def show
  end

  # GET /cell_imagings/new
  def new
    @cell_imaging = CellImaging.new
  end

  # GET /cell_imagings/1/edit
  def edit
  end

  # POST /cell_imagings or /cell_imagings.json
  def create
    @cell_imaging = CellImaging.new(cell_imaging_params)

    respond_to do |format|
      if @cell_imaging.save
        format.html { redirect_to cell_imaging_url(@cell_imaging), notice: "Cell imaging was successfully created." }
        format.json { render :show, status: :created, location: @cell_imaging }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cell_imaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cell_imagings/1 or /cell_imagings/1.json
  def update
    respond_to do |format|
      if @cell_imaging.update(cell_imaging_params)
        format.html { redirect_to cell_imaging_url(@cell_imaging), notice: "Cell imaging was successfully updated." }
        format.json { render :show, status: :ok, location: @cell_imaging }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cell_imaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cell_imagings/1 or /cell_imagings/1.json
  def destroy
    @cell_imaging.destroy

    respond_to do |format|
      format.html { redirect_to cell_imagings_url, notice: "Cell imaging was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cell_imaging
      @cell_imaging = CellImaging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cell_imaging_params
      params.require(:cell_imaging).permit(:sample, :stype, :plate, :expected_wavelenght, :assay_type, :detection, :image_filter, :image_mode, :toxicity, :compatibility, :hazard, :more,:debit, :slotdate, :slottime, :status,:user_id )
    end
end
