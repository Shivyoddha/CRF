class AtomicForceMicroscopesController < ApplicationController
  before_action :set_atomic_force_microscope, only: %i[ show edit update destroy ]

  # GET /atomic_force_microscopes or /atomic_force_microscopes.json
  def index
    @atomic_force_microscopes = AtomicForceMicroscope.all
  end

  # GET /atomic_force_microscopes/1 or /atomic_force_microscopes/1.json
  def show
  end

  # GET /atomic_force_microscopes/new
  def new
    @atomic_force_microscope = AtomicForceMicroscope.new
  end

  # GET /atomic_force_microscopes/1/edit
  def edit
  end

  # POST /atomic_force_microscopes or /atomic_force_microscopes.json
  def create
    @atomic_force_microscope = AtomicForceMicroscope.new(atomic_force_microscope_params)

    respond_to do |format|
      if @atomic_force_microscope.save
        format.html { redirect_to atomic_force_microscope_url(@atomic_force_microscope), notice: "Atomic force microscope was successfully created." }
        format.json { render :show, status: :created, location: @atomic_force_microscope }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atomic_force_microscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atomic_force_microscopes/1 or /atomic_force_microscopes/1.json
  def update
    respond_to do |format|
      if @atomic_force_microscope.update(atomic_force_microscope_params)
        format.html { redirect_to atomic_force_microscope_url(@atomic_force_microscope), notice: "Atomic force microscope was successfully updated." }
        format.json { render :show, status: :ok, location: @atomic_force_microscope }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atomic_force_microscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atomic_force_microscopes/1 or /atomic_force_microscopes/1.json
  def destroy
    @atomic_force_microscope.destroy

    respond_to do |format|
      format.html { redirect_to atomic_force_microscopes_url, notice: "Atomic force microscope was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atomic_force_microscope
      @atomic_force_microscope = AtomicForceMicroscope.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atomic_force_microscope_params
      params.require(:atomic_force_microscope).permit(:sample, :stype, :technique, :scan_rate, :x, :y, :description, :toxicity, :compatability, :carcinogenic, :more, :status,:slotdate,:slottime,:debit)
    end
end
