class LowFatiguesController < ApplicationController
  before_action :set_low_fatigue, only: %i[ show edit update destroy ]

  # GET /low_fatigues or /low_fatigues.json
  def index
    @low_fatigues = LowFatigue.all
  end

  # GET /low_fatigues/1 or /low_fatigues/1.json
  def show
  end

  # GET /low_fatigues/new
  def new
    @user=User.find(params[:id])
    @low_fatigue = LowFatigue.new
    @low_fatigue.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Low Force Fatigue with DMA").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Low Force Fatigue with DMA").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Low Force Fatigue with DMA").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /low_fatigues/1/edit
  def edit
  end

  # POST /low_fatigues or /low_fatigues.json
  def create
    @low_fatigue = LowFatigue.new(low_fatigue_params)
    @low_fatigue.user=current_user
    @low_fatigue.status="pending"
    @low_fatigue.build_equipment_table
    if(@low_fatigue.entry_type== "manual")
      @low_fatigue.equipment_table.dummy = "proforma_confirmed"
      @low_fatigue.equipment_table.equipname = @low_fatigue.dummy1
      @low_fatigue.equipment_table.pay = @low_fatigue.amount
      @low_fatigue.equipment_table.username = @low_fatigue.dummy2
      @low_fatigue.equipment_table.debit_head = @low_fatigue.debit
      @low_fatigue.equipment_table.role = @low_fatigue.dummy3
      @low_fatigue.dummy2 = nil
      @low_fatigue.dummy3 = nil
    else
      @low_fatigue.equipment_table.sample = @low_fatigue.sample
    @low_fatigue.equipment_table.contact_no = @low_fatigue.user.contact
    uploaded_files = params[:low_fatigue][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @low_fatigue.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @low_fatigue.equipment_table.dummy = "alloted"
    @low_fatigue.equipment_table.username = @low_fatigue.user.name
    @low_fatigue.equipment_table.equipname = "Low Force Fatigue with DMA"
    @low_fatigue.equipment_table.app_no = @low_fatigue.id
    @low_fatigue.equipment_table.debit_head = @low_fatigue.debit
    @low_fatigue.equipment_table.role = @low_fatigue.user.role
    @low_fatigue.equipment_table.email = @low_fatigue.user.email
    @low_fatigue.equipment_table.dept = @low_fatigue.user.department
    @low_fatigue.equipment_table.profesion = @low_fatigue.user.profession
    @low_fatigue.equipment_table.orgname = @low_fatigue.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Low Force Fatigue with DMA").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @low_fatigue.save
        if  @low_fatigue.expresssample.present?
         equiplist = Equiplist.where(name: "Low Force Fatigue with DMA").first
         equiplist.expressslot =equiplist.expressslot- @low_fatigue.expresssample
         equiplist.save
        end
        if @low_fatigue.user.role=='student'||@low_fatigue.user.role=='faculty'
          LowFatigueMailer.with(id:@low_fatigue.id, userid:current_user.id).InternalMail.deliver_later
        else
          LowFatigueMailer.with(id:@low_fatigue.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @low_fatigue.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "low_fatigue was successfully created." }
          format.json { render :show, status: :created, location: @low_fatigue }
      else
        format.html { redirect_to home_index_path, notice: "Low fatigue was successfully created." }
        format.json { render :show, status: :created, location: @low_fatigue }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @low_fatigue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /low_fatigues/1 or /low_fatigues/1.json
  def update
    @low_fatigue.status="alloted"

    respond_to do |format|
      if @low_fatigue.update(low_fatigue_params)
        if @low_fatigue.status!= 'completed'
          LowFatigueAllotedMailer.with(id:@low_fatigue.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_low_path, notice: "Low fatigue was successfully updated." }
        format.json { render :show, status: :ok, location: @low_fatigue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @low_fatigue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /low_fatigues/1 or /low_fatigues/1.json
  def destroy
    @low_fatigue.destroy

    respond_to do |format|
      format.html { redirect_to low_fatigues_url, notice: "Low fatigue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_low_fatigue
      @low_fatigue = LowFatigue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def low_fatigue_params
      params.require(:low_fatigue).permit(:sample, :sc1, :st1, :tt1, :tf1, :sc2, :st2, :tt2, :tf2, :sc3, :st3, :tt3, :tf3, :sc4, :st4, :tt4, :tf4, :sc5, :st5, :tt5, :tf5, :more, :slottime, :slotdate, :status, :debit, :m1, :m2, :m3, :m4, :m5, :user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3, :slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] , references: [])
    end
end
