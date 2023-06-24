class RamanMicroscopesController < ApplicationController
  before_action :set_raman_microscope, only: %i[ show edit update destroy ]

  # GET /raman_microscopes or /raman_microscopes.json
  def index
    @raman_microscopes = RamanMicroscope.all
  end

  # GET /raman_microscopes/1 or /raman_microscopes/1.json
  def show
  end

  # GET /raman_microscopes/new
  def new
    @user=User.find(params[:id])
    @raman_microscope = RamanMicroscope.new
    @raman_microscope.build_equipment_table

  end

  # GET /raman_microscopes/1/edit
  def edit
  end

  # POST /raman_microscopes or /raman_microscopes.json
  def create
    @raman_microscope = RamanMicroscope.new(raman_microscope_params)
    @raman_microscope.user=current_user
    @raman_microscope.status="pending"
    @raman_microscope.build_equipment_table
    if(@raman_microscope.entry_type== "manual")
      @raman_microscope.equipment_table.dummy = "proforma_confirmed"
      @raman_microscope.equipment_table.equipname = @raman_microscope.dummy1
      @raman_microscope.equipment_table.pay = @raman_microscope.amount
      @raman_microscope.equipment_table.username = @raman_microscope.dummy2
      @raman_microscope.equipment_table.debit_head = @raman_microscope.debit
      @raman_microscope.equipment_table.role = @raman_microscope.dummy3
      @raman_microscope.dummy2 = nil
      @raman_microscope.dummy3 = nil
    else
    @raman_microscope.equipment_table.dummy = "alloted"
    @raman_microscope.equipment_table.username = @raman_microscope.user.name
    @raman_microscope.equipment_table.equipname = "Raman Spectrometer with PL"
    @raman_microscope.equipment_table.app_no = @raman_microscope.id
    @raman_microscope.equipment_table.debit_head = @raman_microscope.debit
    @raman_microscope.equipment_table.role = @raman_microscope.user.role
    @raman_microscope.equipment_table.email = @raman_microscope.user.email
    @raman_microscope.equipment_table.dept = @raman_microscope.user.department
    @raman_microscope.equipment_table.profesion = @raman_microscope.user.profession
    @raman_microscope.equipment_table.orgname = @raman_microscope.user.orgname
  end

    respond_to do |format|
      if @raman_microscope.save
        if @raman_microscope.user.role=='student'||@raman_microscope.user.role=='faculty'
          RamanMicroscopeMailer.with(id:@raman_microscope.id, userid:current_user.id).InternalMail.deliver_later
        else
          RamanMicroscopeMailer.with(id:@raman_microscope.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @raman_microscope.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "raman_microscope was successfully created." }
            format.json { render :show, status: :created, location: @raman_microscope }
        else
        format.html { redirect_to home_index_path, notice: "Raman microscope was successfully created." }
        format.json { render :show, status: :created, location: @raman_microscope }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @raman_microscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raman_microscopes/1 or /raman_microscopes/1.json
  def update
    @raman_microscope.status="alloted"
    @raman_microscope.build_equipment_table

    respond_to do |format|
      if @raman_microscope.update(raman_microscope_params)
        if @raman_microscope.status!= 'completed'
          RamanMicroscopeAllotedMailer.with(id:@raman_microscope.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_raman_path(@raman_microscope), notice: "Raman microscope was successfully updated." }
        format.json { render :show, status: :ok, location: @raman_microscope }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @raman_microscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raman_microscopes/1 or /raman_microscopes/1.json
  def destroy
    @raman_microscope.destroy

    respond_to do |format|
      format.html { redirect_to raman_microscopes_url, notice: "Raman microscope was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raman_microscope
      @raman_microscope = RamanMicroscope.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raman_microscope_params
      params.require(:raman_microscope).permit(:sample, :measurement, :stype, :description, :toxicity, :Compatability, :carcinogenic, :more,:laser,:debit, :slotdate, :slottime, :status,:user_id ,:entry_type,:amount,:dummy1,:dummy2,:dummy3,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],references: [])
    end
end
