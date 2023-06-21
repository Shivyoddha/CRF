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
    @three_d_scanner.build_equipment_table

  end

  # GET /three_d_scanners/1/edit
  def edit
  end

  # POST /three_d_scanners or /three_d_scanners.json
  def create
    @three_d_scanner = ThreeDScanner.new(three_d_scanner_params)
    @three_d_scanner.user=current_user
    @three_d_scanner.status="pending"
    @three_d_scanner.build_equipment_table
    @three_d_scanner.equipment_table.dummy = "alloted"
    @three_d_scanner.equipment_table.username = @three_d_scanner.user.name
    @three_d_scanner.equipment_table.equipname = "3D-Scanner"
    @three_d_scanner.equipment_table.app_no = @three_d_scanner.id
    @three_d_scanner.equipment_table.debit_head = @three_d_scanner.debit
    @three_d_scanner.equipment_table.role = @three_d_scanner.user.role
    @three_d_scanner.equipment_table.email = @three_d_scanner.user.email
    @three_d_scanner.equipment_table.dept = @three_d_scanner.user.department
    @three_d_scanner.equipment_table.profesion = @three_d_scanner.user.profession
    @three_d_scanner.equipment_table.orgname = @three_d_scanner.user.orgname

    respond_to do |format|
      if @three_d_scanner.save
        if @three_d_scanner.user.role=='student'||@three_d_scanner.user.role=='faculty'
          ThreeDScannerMailer.with(id:@three_d_scanner.id, userid:current_user.id).InternalMail.deliver_later
        else
          ThreeDScannerMailer.with(id:@three_d_scanner.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Three d scanner was successfully created." }
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
    @three_d_scanner.build_equipment_table

    respond_to do |format|
      if @three_d_scanner.update(three_d_scanner_params)
        ThreeDScannerAllotedMailer.with(id:@three_d_scanner.id, userid:current_user.id).Mail.deliver_later
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
      params.require(:three_d_scanner).permit(:sample, :size, :texture, :more, :debit, :slotdate, :slottime, :status,:user_id,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],output_format: [], references: [])
    end
end
