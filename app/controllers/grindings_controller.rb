class GrindingsController < ApplicationController
  before_action :set_grinding, only: %i[ show edit update destroy ]

  # GET /grindings or /grindings.json
  def index
    @grindings = Grinding.all
  end

  # GET /grindings/1 or /grindings/1.json
  def show
  end

  # GET /grindings/new
  def new
    @grinding = Grinding.new
    @user=User.find(params[:id])
    @grinding.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Automatic MultiSpecimen Polisher").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Automatic MultiSpecimen Polisher").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Automatic MultiSpecimen Polisher").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /grindings/1/edit
  def edit
  end

  # POST /grindings or /grindings.json
  def create
    @grinding = Grinding.new(grinding_params)
    @grinding.user=current_user
    @grinding.status="pending"
    @grinding.build_equipment_table
    if(@grinding.entry_type== "manual")
      @grinding.equipment_table.dummy = "proforma_confirmed"
      @grinding.equipment_table.equipname = @grinding.dummy1
      @grinding.equipment_table.pay = @grinding.amount
      @grinding.equipment_table.username = @grinding.dummy2
      @grinding.equipment_table.debit_head = @grinding.debit
      @grinding.equipment_table.role = @grinding.dummy3
      @grinding.dummy2 = nil
      @grinding.dummy3 = nil
    else
    @grinding.equipment_table.dummy = "alloted"
    @grinding.equipment_table.username = @grinding.user.name
    @grinding.equipment_table.equipname = "Automatic MultiSpecimen Polisher"
    @grinding.equipment_table.app_no = @grinding.id
    @grinding.equipment_table.debit_head = @grinding.debit
    @grinding.equipment_table.role = @grinding.user.role
    @grinding.equipment_table.email = @grinding.user.email
    @grinding.equipment_table.dept = @grinding.user.department
    @grinding.equipment_table.profesion = @grinding.user.profession
    @grinding.equipment_table.orgname = @grinding.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Automatic MultiSpecimen Polisher").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @grinding.save
        if  @grinding.expresssample.present?
        equiplist = Equiplist.where(name: "Automatic MultiSpecimen Polisher").first
        equiplist.expressslot =equiplist.expressslot- @grinding.expresssample
        equiplist.save
       end
        if @grinding.user.role=='student'||@grinding.user.role=='faculty'
          GrindingMailer.with(id:@grinding.id, userid:current_user.id).InternalMail.deliver_later
        else
          GrindingMailer.with(id:@grinding.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @grinding.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "grinding was successfully created." }
            format.json { render :show, status: :created, location: @grinding }
        else
        format.html { redirect_to home_index_path, notice: "Grinding was successfully created." }
        format.json { render :show, status: :created, location: @grinding }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grinding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grindings/1 or /grindings/1.json
  def update
      @grinding.status="alloted"
      @grinding.build_equipment_table
    respond_to do |format|
      if @grinding.update(grinding_params)
        if @grinding.status!= 'completed'
          GrindingAllotedMailer.with(id:@grinding.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_grind_path(@grinding), notice: "Grinding was successfully updated." }
        format.json { render :show, status: :ok, location: @grinding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grinding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grindings/1 or /grindings/1.json
  def destroy
    @grinding.destroy

    respond_to do |format|
      format.html { redirect_to home_index_path, notice: "Grinding was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grinding
      @grinding = Grinding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grinding_params
      params.require(:grinding).permit(:sample, :diameter, :mould, :lapping, :more, :status, :slotdate, :slottime, :debit,:user_id,:entry_type, :dummy1,:dummy2,:dummy3,:amount,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] ,grit: [],diamond: [],suspension: [], references: [])
    end
end
