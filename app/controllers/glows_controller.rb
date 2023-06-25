class GlowsController < ApplicationController
  before_action :set_glow, only: %i[ show edit update destroy ]

  # GET /glows or /glows.json
  def index
    @glows = Glow.all
  end

  # GET /glows/1 or /glows/1.json
  def show
  end

  # GET /glows/new
  def new
    @glow = Glow.new
    @user=User.find(params[:id])
    @glow.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Glow Discharges-OES").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Glow Discharges-OES").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Glow Discharges-OES").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /glows/1/edit
  def edit
  end

  # POST /glows or /glows.json
  def create
    @glow = Glow.new(glow_params)
    @glow.user=current_user
    @glow.status="pending"
    @glow.build_equipment_table
    if(@glow.entry_type== "manual")
      @glow.equipment_table.dummy = "proforma_confirmed"
      @glow.equipment_table.equipname = @glow.dummy1
      @glow.equipment_table.pay = @glow.amount
      @glow.equipment_table.username = @glow.dummy2
      @glow.equipment_table.debit_head = @glow.debit
      @glow.equipment_table.role = @glow.dummy3
      @glow.dummy2 = nil
      @glow.dummy3 = nil
    else
    @glow.equipment_table.dummy = "alloted"
    @glow.equipment_table.username = @glow.user.name
    @glow.equipment_table.equipname = "Glow"
    @glow.equipment_table.app_no = @glow.id
    @glow.equipment_table.debit_head = @glow.debit
    @glow.equipment_table.role = @glow.user.role
    @glow.equipment_table.email = @glow.user.email
    @glow.equipment_table.dept = @glow.user.department
    @glow.equipment_table.profesion = @glow.user.profession
    @glow.equipment_table.orgname = @glow.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Glow Discharges-OES").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }


    respond_to do |format|
      if @glow.save
        if  @glow.expresssample.present?
         equiplist = Equiplist.where(name: "Glow Discharges-OES").first
         equiplist.expressslot =equiplist.expressslot- @glow.expresssample
         equiplist.save
        end

        if @glow.user.role=='student'||@glow.user.role=='faculty'
          GlowMailer.with(id:@glow.id, userid:current_user.id).InternalMail.deliver_later
        else
          GlowMailer.with(id:@glow.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @glow.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "glow was successfully created." }
            format.json { render :show, status: :created, location: @glow }
        else
        format.html { redirect_to home_index_path, notice: "Glow was successfully created." }
        format.json { render :show, status: :created, location: @glow }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @glow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glows/1 or /glows/1.json
  def update
    @glow.status="alloted"
    @glow.build_equipment_table

    respond_to do |format|
      if @glow.update(glow_params)
        if @glow.status!= 'completed'
          GlowsAllotedMailer.with(id:@glow.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_glow_path(@glow), notice: "Glow was successfully updated." }
        format.json { render :show, status: :ok, location: @glow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @glow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glows/1 or /glows/1.json
  def destroy
    @glow.destroy

    respond_to do |format|
      format.html { redirect_to glows_url, notice: "Glow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glow
      @glow = Glow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def glow_params
      params.require(:glow).permit(:sample, :elemental, :coated, :coated_ele, :substarte, :specification, :more, :status, :slotdate, :slottime, :debit,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] ,references: [])
    end
end
