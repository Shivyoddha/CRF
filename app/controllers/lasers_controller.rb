class LasersController < ApplicationController
  before_action :set_laser, only: %i[ show edit update destroy ]

  # GET /lasers or /lasers.json
  def index
    @lasers = Laser.all
  end

  # GET /lasers/1 or /lasers/1.json
  def show
  end

  # GET /lasers/new
  def new
    @laser = Laser.new
    @laser.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Laser Flash Analyser").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Laser Flash Analyser").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Laser Flash Analyser").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /lasers/1/edit
  def edit
  end

  # POST /lasers or /lasers.json
  def create
    @laser = Laser.new(laser_params)
    @laser.user=current_user
    @laser.status="pending"
    @laser.build_equipment_table
    if(@laser.entry_type== "manual")
      @laser.equipment_table.dummy = "proforma_confirmed"
      @laser.equipment_table.equipname = @laser.dummy1
      @laser.equipment_table.pay = @laser.amount
      @laser.equipment_table.username = @laser.dummy2
      @laser.equipment_table.debit_head = @laser.debit
      @laser.equipment_table.role = @laser.dummy3
      @laser.dummy2 = nil
      @laser.dummy3 = nil
    else
    @laser.equipment_table.dummy = "alloted"
    @laser.equipment_table.username = @laser.user.name
    @laser.equipment_table.equipname = "Laser Flash Analyser"
    @laser.equipment_table.app_no = @laser.id
    @laser.equipment_table.debit_head = @laser.debit
    @laser.equipment_table.role = @laser.user.role
    @laser.equipment_table.email = @laser.user.email
    @laser.equipment_table.dept = @laser.user.department
    @laser.equipment_table.profesion = @laser.user.profession
    @laser.equipment_table.orgname = @laser.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Laser Flash Analyser").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @laser.save
        if  @laser.expresssample.present?
         equiplist = Equiplist.where(name: "Laser Flash Analyser").first
         equiplist.expressslot =equiplist.expressslot- @laser.expresssample
         equiplist.save
        end
        if @laser.user.role=='student'||@laser.user.role=='faculty'
          LaserMailer.with(id:@laser.id, userid:current_user.id).InternalMail.deliver_later
        else
          LaserMailer.with(id:@laser.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @laser.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "laser was successfully created." }
          format.json { render :show, status: :created, location: @laser }
      else
        format.html { redirect_to home_index_path, notice: "Laser was successfully created." }
        format.json { render :show, status: :created, location: @laser }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lasers/1 or /lasers/1.json
  def update
    @laser.status="alloted"
    @laser.build_equipment_table

    respond_to do |format|
      if @laser.update(laser_params)
        if @laser.status!= 'completed'
          LaserAllotedMailer.with(id:@laser.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_laser_path(@laser), notice: "Laser was successfully updated." }
        format.json { render :show, status: :ok, location: @laser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lasers/1 or /lasers/1.json
  def destroy
    @laser.destroy

    respond_to do |format|
      format.html { redirect_to lasers_url, notice: "Laser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laser
      @laser = Laser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laser_params
      params.require(:laser).permit(:sample, :composition, :stype, :temp_points, :toxicity, :compatibility, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3, :slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] , references: [])
    end
end
