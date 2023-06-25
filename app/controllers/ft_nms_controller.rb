class FtNmsController < ApplicationController
  before_action :set_ft_nm, only: %i[ show edit update destroy ]

  # GET /ft_nms or /ft_nms.json
  def index
    @ft_nms = FtNm.all
  end

  # GET /ft_nms/1 or /ft_nms/1.json
  def show
  end

  # GET /ft_nms/new
  def new
    @ft_nm = FtNm.new
    @user=User.find(params[:id])
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "FT-NMR").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "FT-NMR").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "FT-NMR").pluck(:expressend).first&.strftime("%d/%m/%Y")
  end

  # GET /ft_nms/1/edit
  def edit
  end

  # POST /ft_nms or /ft_nms.json
  def create
    @ft_nm = FtNm.new(ft_nm_params)
    @ft_nm.user=current_user
    @ft_nm.status="pending"
    @ft_nm.build_equipment_table
    if(@ft_nm.entry_type== "manual")
      @ft_nm.equipment_table.dummy = "proforma_confirmed"
      @ft_nm.equipment_table.equipname = @ft_nm.dummy1
      @ft_nm.equipment_table.pay = @ft_nm.amount
      @ft_nm.equipment_table.username = @ft_nm.dummy2
      @ft_nm.equipment_table.debit_head = @ft_nm.debit
      @ft_nm.equipment_table.role = @ft_nm.dummy3
      @ft_nm.dummy2 = nil
      @ft_nm.dummy3 = nil
    else
    @ft_nm.equipment_table.dummy = "alloted"
    @ft_nm.equipment_table.username = @ft_nm.user.name
    @ft_nm.equipment_table.equipname = "ft_nm"
    @ft_nm.equipment_table.app_no = @ft_nm.id
    @ft_nm.equipment_table.debit_head = @ft_nm.debit
    @ft_nm.equipment_table.role = @ft_nm.user.role
    @ft_nm.equipment_table.email = @ft_nm.user.email
    @ft_nm.equipment_table.dept = @ft_nm.user.department
    @ft_nm.equipment_table.profesion = @ft_nm.user.profession
    @ft_nm.equipment_table.orgname = @ft_nm.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "FT-NMR").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    respond_to do |format|
      if @ft_nm.save
        if  @ft_nm.expresssample.present?
         equiplist = Equiplist.where(name: "FT-NMR").first
         equiplist.expressslot =equiplist.expressslot- @ft_nm.expresssample
         equiplist.save
        end
        if @ft_nm.user.role=='student'||@ft_nm.user.role=='faculty'
          FtNmrMailer.with(id:@ft_nm.id, userid:current_user.id).InternalMail.deliver_later
        else
          FtNmrMailer.with(id:@ft_nm.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @ft_nm.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "ft_nm was successfully created." }
            format.json { render :show, status: :created, location: @ft_nm }
        else
        format.html { redirect_to home_index_path, notice: "Ft nm was successfully created." }
        format.json { render :show, status: :created, location: @ft_nm }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ft_nm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ft_nms/1 or /ft_nms/1.json
  def update
      @ft_nm.status="alloted"
      @ft_nm.build_equipment_table
    respond_to do |format|
      if @ft_nm.update(ft_nm_params)
        if @ft_nm.status!= 'completed'
          FtNmrAllotedMailer.with(id:@ft_nm.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_ftnmr_path(@ft_nm), notice: "Ft nm was successfully updated." }
        format.json { render :show, status: :ok, location: @ft_nm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ft_nm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ft_nms/1 or /ft_nms/1.json
  def destroy
    @ft_nm.destroy

    respond_to do |format|
      format.html { redirect_to ft_nms_url, notice: "Ft nm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ft_nm
      @ft_nm = FtNm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ft_nm_params
      params.require(:ft_nm).permit(:sample, :nature, :phase, :solvent1,  :solvent2,  :solvent3,  :solvent4, :solvent5,:temp, :toxicity, :health, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type, :amount,:dummy1,:dummy2,:dummy3,:amount,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname],references: [],hazardmethod: [],measurement1: [],measurement2: [],measurement3: [],measurement4: [],measurement5: [])
    end
end
