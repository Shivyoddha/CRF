class XrdsController < ApplicationController
  before_action :set_xrd, only: %i[ show edit update destroy ]
  def import
    return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
    return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    CsvImportService.new.call_xrd(params[:file])

    redirect_to request.referer, notice: 'Import started...'
  end

  # GET /xrds or /xrds.json
  def index
    @xrds = Xrd.all
  end

  # GET /xrds/1 or /xrds/1.json
  def show

  end

  # GET /xrds/new
  def new
    @user=User.find(params[:id])
    @xrd = Xrd.new()
    @xrd.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "XRD").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "XRD").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "XRD").pluck(:expressend).first&.strftime("%d/%m/%Y")
  end

  # GET /xrds/1/edit
  def edit
  end

  # POST /xrds or /xrds.json
  def create
    @xrd = Xrd.new(xrd_params)
    xrd_id = @xrd.id
    @xrd.user=current_user
    @xrd.status="pending"
    @xrd.build_equipment_table
    if(@xrd.entry_type== "manual")
      @xrd.equipment_table.dummy = "proforma_confirmed"
      @xrd.equipment_table.equipname = @xrd.dummy1
      @xrd.equipment_table.pay = @xrd.amount
      @xrd.equipment_table.username = @xrd.dummy2
      @xrd.equipment_table.debit_head = @xrd.debit
      @xrd.equipment_table.role = @xrd.dummy3
      @xrd.dummy2 = nil
      @xrd.dummy3 = nil
    else
    @xrd.equipment_table.dummy = "alloted"
    @xrd.equipment_table.username = @xrd.user.name
    @xrd.equipment_table.equipname = "XRD"
    @xrd.equipment_table.debit_head = @xrd.debit
    @xrd.equipment_table.role = @xrd.user.role
    @xrd.equipment_table.email = @xrd.user.email
    @xrd.equipment_table.dept = @xrd.user.department
    @xrd.equipment_table.profesion = @xrd.user.profession
    @xrd.equipment_table.orgname = @xrd.user.orgname
    end
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "XRD").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    respond_to do |format|
      if @xrd.save
        if  @xrd.expresssample.present?
         equiplist = Equiplist.where(name: "XRD").first
         equiplist.expressslot =equiplist.expressslot- @xrd.expresssample
         equiplist.save
        end
        if @xrd.user.role=='student'||@xrd.user.role=='faculty'
          XRayDiffractionMailer.with(id:@xrd.id, userid:current_user.id).InternalMail.deliver_later
        else
          XRayDiffractionMailer.with(id:@xrd.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @xrd.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "Xrd was successfully created." }
            format.json { render :show, status: :created, location: @xrd }
        else
        format.html { redirect_to home_index_path, notice: "Xrd was successfully created." }
        format.json { render :show, status: :created, location: @xrd }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @xrd.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /xrds/1 or /xrds/1.json
  def update
     @xrd.status="alloted"
     @xrd.build_equipment_table

    respond_to do |format|
      if @xrd.update(xrd_params)
        if @xrd.status!= 'completed'
          XrdAllotedMailer.with(id:@xrd.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_xrd_path, notice: "Xrd was successfully updated."}
        format.json { render :show, status: :ok, location: @xrd }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @xrd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xrds/1 or /xrds/1.json
  def destroy
    @xrd.destroy

    respond_to do |format|
      format.html { redirect_to xrds_url, notice: "Xrd was successfully destroyed."}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xrd
      @xrd = Xrd.find(params[:id])
    end

   # Only allow a list of trusted parameters through.
    def xrd_params
      params.require(:xrd).permit(:sample, :measurement, :composition, :stype, :mind, :maxd,:more, :debit, :slotdate, :slottime, :status, :amount,:user_id, :entry_type,:amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname, :reg_no] ,references: [])
    end
end
