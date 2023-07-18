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
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "3D-Scanner").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "3D-Scanner").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "3D-Scanner").pluck(:expressend).first&.strftime("%d/%m/%Y")
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
    if(@three_d_scanner.entry_type== "manual")
    @three_d_scanner.equipment_table.dummy = "proforma_confirmed"
    @three_d_scanner.equipment_table.equipname = @three_d_scanner.dummy1
    @three_d_scanner.equipment_table.pay = @three_d_scanner.amount
    @three_d_scanner.equipment_table.username = @three_d_scanner.dummy2
    @three_d_scanner.equipment_table.debit_head = @three_d_scanner.debit
    @three_d_scanner.equipment_table.role = @three_d_scanner.dummy3
    @three_d_scanner.dummy2 = nil
    @three_d_scanner.dummy3 = nil
  else
      @three_d_scanner.equipment_table.sample = @three_d_scanner.sample
    @three_d_scanner.equipment_table.contact_no = @three_d_scanner.user.contact
    uploaded_files = params[:three_d_scanner][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @three_d_scanner.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
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
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "3D-Scanner").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @three_d_scanner.save
        if  @three_d_scanner.expresssample.present?
         equiplist = Equiplist.where(name: "3D-Scanner").first
         equiplist.expressslot =equiplist.expressslot- @three_d_scanner.expresssample
         equiplist.save
        end
        if @three_d_scanner.user.role=='student'||@three_d_scanner.user.role=='faculty'
          ThreeDScannerMailer.with(id:@three_d_scanner.id, userid:current_user.id).InternalMail.deliver_later
        else
          ThreeDScannerMailer.with(id:@three_d_scanner.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @three_d_scanner.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "three_d_scanner was successfully created." }
            format.json { render :show, status: :created, location: @three_d_scanner }
        else
        format.html { redirect_to home_index_path, notice: "Three d scanner was successfully created." }
        format.json { render :show, status: :created, location: @three_d_scanner }
      end
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
        if @three_d_scanner.status!= 'completed'
        #ThreeDScannerAllotedMailer.with(id:@three_d_scanner.id, userid:current_user.id).Mail.deliver_later
      end
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
      params.require(:three_d_scanner).permit(:sample, :size, :texture, :more, :debit, :slotdate, :slottime, :status,:user_id,:amount,:dummy1,:dummy2,:dummy3,:entry_type,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],output_format: [], references: [])
    end
end
