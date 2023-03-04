class ThreeDScannersController < ApplicationController
  before_action :set_three_d_scanner, only: %i[ show edit update destroy ]

  # GET /three_d_scanners or /three_d_scanners.json
  def index
    @three_d_scanners = ThreeDScanner.all
  end

  # GET /three_d_scanners/1 or /three_d_scanners/1.json
  def show
  end

  # GET /three_d_scanners/new
  def new
    @three_d_scanner = ThreeDScanner.new
  end

  # GET /three_d_scanners/1/edit
  def edit
  end

  # POST /three_d_scanners or /three_d_scanners.json
  def create
    @three_d_scanner = ThreeDScanner.new(three_d_scanner_params)
    @three_d_scanner.user=current_user
    @three_d_scanner.status="pending"
    respond_to do |format|
      if @three_d_scanner.save
        ThreeDScannerMailer.with(id:@three_d_scanner.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to three_d_scanner_url(@three_d_scanner), notice: "Three d scanner was successfully created." }
        format.json { render :show, status: :created, location: @three_d_scanner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @three_d_scanner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /three_d_scanners/1 or /three_d_scanners/1.json
  def update
    @three_d_scanner.status="alloted"
    respond_to do |format|
      if @three_d_scanner.update(three_d_scanner_params)
        format.html { redirect_to slotbooker_threescanner_path(@three_d_scanner), notice: "Three d scanner was successfully updated." }
        format.json { render :show, status: :ok, location: @three_d_scanner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @three_d_scanner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /three_d_scanners/1 or /three_d_scanners/1.json
  def destroy
    @three_d_scanner.destroy

    respond_to do |format|
      format.html { redirect_to three_d_scanners_url, notice: "Three d scanner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_three_d_scanner
      @three_d_scanner = ThreeDScanner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def three_d_scanner_params
      params.require(:three_d_scanner).permit(:sample, :size, :texture, :ply, :stt, :wrl, :obj, :asc, :aop, :ptx, :xyzrgb, :more, :debit, :slotdate, :slottime, :status,:user_id, references: [])
    end
end
