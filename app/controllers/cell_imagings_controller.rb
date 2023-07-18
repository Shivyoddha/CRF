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
    @cell_imaging.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Cell-Imaging MultiMode Reader").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Cell-Imaging MultiMode Reader").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Cell-Imaging MultiMode Reader").pluck(:expressend).first&.strftime("%d/%m/%Y")


  end

  # GET /cell_imagings/1/edit
  def edit
  end

  # POST /cell_imagings or /cell_imagings.json
  def create
    @cell_imaging = CellImaging.new(cell_imaging_params)
    @cell_imaging.user=current_user
    @cell_imaging.status="pending"
    @cell_imaging.build_equipment_table
    if(@cell_imaging.entry_type== "manual")
      @cell_imaging.equipment_table.dummy = "proforma_confirmed"
      @cell_imaging.equipment_table.equipname = @cell_imaging.dummy1
      @cell_imaging.equipment_table.pay = @cell_imaging.amount
      @cell_imaging.equipment_table.username = @cell_imaging.dummy2
      @cell_imaging.equipment_table.debit_head = @cell_imaging.debit
      @cell_imaging.equipment_table.role = @cell_imaging.dummy3
      @cell_imaging.dummy2 = nil
      @cell_imaging.dummy3 = nil
    else
      @cell_imaging.equipment_table.sample = @cell_imaging.sample
    @cell_imaging.equipment_table.contact_no = @cell_imaging.user.contact
    uploaded_files = params[:cell_imaging][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @cell_imaging.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @cell_imaging.equipment_table.dummy = "alloted"
    @cell_imaging.equipment_table.username = @cell_imaging.user.name
    @cell_imaging.equipment_table.equipname = "Cell-Imaging MultiMode Reader"
    @cell_imaging.equipment_table.app_no = @cell_imaging.id
    @cell_imaging.equipment_table.debit_head = @cell_imaging.debit
    @cell_imaging.equipment_table.role = @cell_imaging.user.role
    @cell_imaging.equipment_table.email = @cell_imaging.user.email
    @cell_imaging.equipment_table.dept = @cell_imaging.user.department
    @cell_imaging.equipment_table.profesion = @cell_imaging.user.profession
    @cell_imaging.equipment_table.orgname = @cell_imaging.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Cell-Imaging MultiMode Reader").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @cell_imaging.save
        if  @cell_imaging.expresssample.present?
         equiplist = Equiplist.where(name: "Cell-Imaging MultiMode Reader").first
         equiplist.expressslot =equiplist.expressslot- @cell_imaging.expresssample
         equiplist.save
        end

        if @cell_imaging.user.role=='student'||@cell_imaging.user.role=='faculty'
          CellImagingMailer.with(id:@cell_imaging.id, userid:current_user.id).InternalMail.deliver_later
        else
          CellImagingMailer.with(id:@cell_imaging.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @cell_imaging.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "cell_imaging was successfully created." }
            format.json { render :show, status: :created, location: @cell_imaging }
        else
        format.html { redirect_to home_index_path, notice: "Cell imaging was successfully created." }
        format.json { render :show, status: :created, location: @cell_imaging }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cell_imaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cell_imagings/1 or /cell_imagings/1.json
  def update
      @cell_imaging.status="alloted"
    respond_to do |format|
      if @cell_imaging.update(cell_imaging_params)
        if @cell_imaging.status!= 'completed'
          CellImagingAllotedMailer.with(id:@cell_imaging.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_cell_path(@cell_imaging), notice: "Cell imaging was successfully updated." }
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
      params.require(:cell_imaging).permit(:sample, :stype, :plate, :expected_wavelenght, :assay_type, :detection, :image_filter, :image_mode, :toxicity, :compatibility, :hazard, :more,:debit, :slotdate, :slottime, :status,:user_id, :entry_type, :amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] ,references: [] )
    end
end
