class TgaFttrsController < ApplicationController
  before_action :set_tga_fttr, only: %i[ show edit update destroy ]

  # GET /tga_fttrs or /tga_fttrs.json
  def index
    @tga_fttrs = TgaFttr.all
  end

  # GET /tga_fttrs/1 or /tga_fttrs/1.json
  def show
  end

  # GET /tga_fttrs/new
  def new
    @tga_fttr = TgaFttr.new
    @tga_fttr.build_equipment_table
  end

  # GET /tga_fttrs/1/edit
  def edit
  end

  # POST /tga_fttrs or /tga_fttrs.json
  def create
    @tga_fttr = TgaFttr.new(tga_fttr_params)
    @tga_fttr.user=current_user
    @tga_fttr.status="pending"
    @tga_fttr.build_equipment_table
    if(@tga_fttr.entry_type== "manual")
  @tga_fttr.equipment_table.dummy = "proforma_confirmed"
  @tga_fttr.equipment_table.equipname = @tga_fttr.dummy1
  @tga_fttr.equipment_table.pay = @tga_fttr.amount
  @tga_fttr.equipment_table.username = @tga_fttr.dummy2
  @tga_fttr.equipment_table.debit_head = @tga_fttr.debit
  @tga_fttr.equipment_table.role = @tga_fttr.dummy3
  @tga_fttr.dummy2 = nil
  @tga_fttr.dummy3 = nil
else
    @tga_fttr.equipment_table.dummy = "alloted"
    @tga_fttr.equipment_table.username = @tga_fttr.user.name
    @tga_fttr.equipment_table.equipname = "TGA-FTIR"
    @tga_fttr.equipment_table.app_no = @tga_fttr.id
    @tga_fttr.equipment_table.debit_head = @tga_fttr.debit
    @tga_fttr.equipment_table.role = @tga_fttr.user.role
    @tga_fttr.equipment_table.email = @tga_fttr.user.email
    @tga_fttr.equipment_table.dept = @tga_fttr.user.department
    @tga_fttr.equipment_table.profesion = @tga_fttr.user.profession
    @tga_fttr.equipment_table.orgname = @tga_fttr.user.orgname
    end

    respond_to do |format|
      if @tga_fttr.save
        if @tga_fttr.user.role=='student'||@tga_fttr.user.role=='faculty'
          TgaFttrMailer.with(id:@tga_fttr.id, userid:current_user.id).InternalMail.deliver_later
        else
          TgaFttrMailer.with(id:@tga_fttr.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @tga_fttr.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "tga_fttr was successfully created." }
          format.json { render :show, status: :created, location: @tga_fttr }
      else
        format.html { redirect_to home_index_path, notice: "Tga fttr was successfully created." }
        format.json { render :show, status: :created, location: @tga_fttr }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tga_fttr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tga_fttrs/1 or /tga_fttrs/1.json
  def update
      @tga_fttr.status="alloted"
      @tga_fttr.build_equipment_table
    respond_to do |format|
      if @tga_fttr.update(tga_fttr_params)
        if @tga_fttr.status!= 'completed'
          TgaFttrAllotedMailer.with(id:@tga_fttr.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_tga_path(@tga_fttr), notice: "Tga fttr was successfully updated." }
        format.json { render :show, status: :ok, location: @tga_fttr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tga_fttr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tga_fttrs/1 or /tga_fttrs/1.json
  def destroy
    @tga_fttr.destroy

    respond_to do |format|
      format.html { redirect_to tga_fttrs_url, notice: "Tga fttr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tga_fttr
      @tga_fttr = TgaFttr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tga_fttr_params
      params.require(:tga_fttr).permit(:sample, :measurement, :stype, :description, :nature, :min_temp, :max_temp, :scan_rate, :atmosphere, :hazard, :compatability, :carcinogenic, :explosive, :more,:yordinate,:kbr,:atr,:debit,:slotdate,:slottime,:user_id,:entry_type,:dummy1,:dummy2,:dummy3,:amount,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],references: [])
    end
end
