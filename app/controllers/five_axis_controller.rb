class FiveAxisController < ApplicationController
  before_action :set_five_axi, only: %i[ show edit update destroy ]

  # GET /five_axis or /five_axis.json
  def index
    @five_axis = FiveAxi.all
  end

  # GET /five_axis/1 or /five_axis/1.json
  def show
  end

  # GET /five_axis/new
  def new
    @five_axi = FiveAxi.new()
    @five_axi.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "5-Axes CNC").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "5-Axes CNC").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "5-Axes CNC").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /five_axis/1/edit
  def edit
  end

  # POST /five_axis or /five_axis.json
  def create
    @five_axi = FiveAxi.new(five_axi_params)
    @five_axi.user=current_user
    @five_axi.status="pending"
    @five_axi.build_equipment_table
    if(@five_axi.entry_type== "manual")
      @five_axi.equipment_table.dummy = "proforma_confirmed"
      @five_axi.equipment_table.equipname = @five_axi.dummy1
      @five_axi.equipment_table.pay = @five_axi.amount
      @five_axi.equipment_table.username = @five_axi.dummy2
      @five_axi.equipment_table.debit_head = @five_axi.debit
      @five_axi.equipment_table.role = @five_axi.dummy3
      @five_axi.dummy2 = nil
      @five_axi.dummy3 = nil
    else
      @five_axi.equipment_table.sample = @five_axi.sample
    @five_axi.equipment_table.contact_no = @five_axi.user.contact
    uploaded_files = params[:five_axi][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @five_axi.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @five_axi.equipment_table.dummy = "alloted"
    @five_axi.equipment_table.username = @five_axi.user.name
    @five_axi.equipment_table.equipname = "5-Axes CNC"
    @five_axi.equipment_table.app_no = @five_axi.id
    @five_axi.equipment_table.debit_head = @five_axi.debit
    @five_axi.equipment_table.role = @five_axi.user.role
    @five_axi.equipment_table.email = @five_axi.user.email
    @five_axi.equipment_table.dept = @five_axi.user.department
    @five_axi.equipment_table.profesion = @five_axi.user.profession
    @five_axi.equipment_table.orgname = @five_axi.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "5-Axes CNC").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @five_axi.save
        if  @five_axi.expresssample.present?
        equiplist = Equiplist.where(name: "5-Axes CNC").first
        equiplist.expressslot =equiplist.expressslot- @five_axi.expresssample
        equiplist.save
       end
        if @five_axi.user.role=='student'||@five_axi.user.role=='faculty'
          FiveAxiMailer.with(id:@five_axi.id, userid:current_user.id).InternalMail.deliver_later
        else
          FiveAxiMailer.with(id:@five_axi.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @five_axi.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "five_axi was successfully created." }
            format.json { render :show, status: :created, location: @five_axi }
        else
        format.html { redirect_to home_index_path, notice: "Five axi was successfully created." }
        format.json { render :show, status: :created, location: @five_axi }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @five_axi.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /five_axis/1 or /five_axis/1.json
  def update
      @five_axi.status="alloted"
    respond_to do |format|
      if @five_axi.update(five_axi_params)
        if @five_axi.status!= 'completed'
          FiveAxiAllotedMailer.with(id:@five_axi.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_fiveaxis_path(@five_axi), notice: "Five axi was successfully updated." }
        format.json { render :show, status: :ok, location: @five_axi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @five_axi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /five_axis/1 or /five_axis/1.json
  def destroy
    @five_axi.destroy

    respond_to do |format|
      format.html { redirect_to five_axis_url, notice: "Five axi was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_five_axi
      @five_axi = FiveAxi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def five_axi_params
      params.require(:five_axi).permit(:sample, :material, :depth, :operation, :tool, :specimentolerance, :cncprogram, :rotationalspeed, :feedrate, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:dummy1,:dummy2,:dummy3, :amount,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
