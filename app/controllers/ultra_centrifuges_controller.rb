class UltraCentrifugesController < ApplicationController
  before_action :set_ultra_centrifuge, only: %i[ show edit update destroy ]

  # GET /ultra_centrifuges or /ultra_centrifuges.json
  def index
    @ultra_centrifuges = UltraCentrifuge.all
  end

  # GET /ultra_centrifuges/1 or /ultra_centrifuges/1.json
  def show
  end

  # GET /ultra_centrifuges/new
  def new
    @ultra_centrifuge = UltraCentrifuge.new
    @ultra_centrifuge.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Ultra-Centrifuge").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Ultra-Centrifuge").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Ultra-Centrifuge").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /ultra_centrifuges/1/edit
  def edit
  end

  # POST /ultra_centrifuges or /ultra_centrifuges.json
  def create
    @ultra_centrifuge = UltraCentrifuge.new(ultra_centrifuge_params)
    @ultra_centrifuge.user=current_user
    @ultra_centrifuge.status="pending"
    @ultra_centrifuge.build_equipment_table
    if(@ultra_centrifuge.entry_type== "manual")
    @ultra_centrifuge.equipment_table.dummy = "proforma_confirmed"
    @ultra_centrifuge.equipment_table.equipname = @ultra_centrifuge.dummy1
    @ultra_centrifuge.equipment_table.pay = @ultra_centrifuge.amount
    @ultra_centrifuge.equipment_table.username = @ultra_centrifuge.dummy2
    @ultra_centrifuge.equipment_table.debit_head = @ultra_centrifuge.debit
    @ultra_centrifuge.equipment_table.role = @ultra_centrifuge.dummy3
    @ultra_centrifuge.dummy2 = nil
    @ultra_centrifuge.dummy3 = nil
  else
    @ultra_centrifuge.equipment_table.dummy = "alloted"
    @ultra_centrifuge.equipment_table.username = @ultra_centrifuge.user.name
    @ultra_centrifuge.equipment_table.equipname = "Ultra-Centrifuge"
    @ultra_centrifuge.equipment_table.app_no = @ultra_centrifuge.id
    @ultra_centrifuge.equipment_table.debit_head = @ultra_centrifuge.debit
    @ultra_centrifuge.equipment_table.role = @ultra_centrifuge.user.role
    @ultra_centrifuge.equipment_table.email = @ultra_centrifuge.user.email
    @ultra_centrifuge.equipment_table.dept = @ultra_centrifuge.user.department
    @ultra_centrifuge.equipment_table.profesion = @ultra_centrifuge.user.profession
    @ultra_centrifuge.equipment_table.orgname = @ultra_centrifuge.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Ultra-Centrifuge").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @ultra_centrifuge.save
        if  @ultra_centrifuge.expresssample.present?
        equiplist = Equiplist.where(name: "Ultra-Centrifuge").first
        equiplist.expressslot =equiplist.expressslot- @ultra_centrifuge.expresssample
        equiplist.save
       end

        if @ultra_centrifuge.user.role=='student'||@ultra_centrifuge.user.role=='faculty'
          UltraCentrifugeMailer.with(id:@ultra_centrifuge.id, userid:current_user.id).InternalMail.deliver_later
        else
          UltraCentrifugeMailer.with(id:@ultra_centrifuge.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @ultra_centrifuge.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "ultra_centrifuge was successfully created." }
            format.json { render :show, status: :created, location: @ultra_centrifuge }
        else
        format.html { redirect_to home_index_path, notice: "Ultra centrifuge was successfully created." }
        format.json { render :show, status: :created, location: @ultra_centrifuge }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ultra_centrifuge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ultra_centrifuges/1 or /ultra_centrifuges/1.json
  def update
      @ultra_centrifuge.status="alloted"
      @ultra_centrifuge.build_equipment_table

    respond_to do |format|
      if @ultra_centrifuge.update(ultra_centrifuge_params)
        if @ultra_centrifuge.status!= 'completed'
          UltraCentrifugeAllotedMailer.with(id:@ultra_centrifuge.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_centrifuge_path(@ultra_centrifuge), notice: "Ultra centrifuge was successfully updated." }
        format.json { render :show, status: :ok, location: @ultra_centrifuge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ultra_centrifuge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ultra_centrifuges/1 or /ultra_centrifuges/1.json
  def destroy
    @ultra_centrifuge.destroy

    respond_to do |format|
      format.html { redirect_to ultra_centrifuges_url, notice: "Ultra centrifuge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ultra_centrifuge
      @ultra_centrifuge = UltraCentrifuge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ultra_centrifuge_params
      params.require(:ultra_centrifuge).permit(:sample, :volume, :speed, :temperature, :toxicity, :compatibility, :carcinogenic, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:dummy1,:dummy2,:dummy3, :amount,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],references: [])
    end
end
