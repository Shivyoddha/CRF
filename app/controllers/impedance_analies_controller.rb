class ImpedanceAnaliesController < ApplicationController
  before_action :set_impedance_analy, only: %i[ show edit update destroy ]

  # GET /impedance_analies or /impedance_analies.json
  def index
    @impedance_analies = ImpedanceAnaly.all
  end

  # GET /impedance_analies/1 or /impedance_analies/1.json
  def show
  end

  # GET /impedance_analies/new
  def new
    @impedance_analy = ImpedanceAnaly.new
    @impedance_analy.build_equipment_table
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Impedance Analyzer").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Impedance Analyzer").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Impedance Analyzer").pluck(:expressend).first&.strftime("%d/%m/%Y")
  end

  # GET /impedance_analies/1/edit
  def edit
  end

  # POST /impedance_analies or /impedance_analies.json
  def create
    @impedance_analy = ImpedanceAnaly.new(impedance_analy_params)
    @impedance_analy.user=current_user
    @impedance_analy.status="pending"
    @impedance_analy.build_equipment_table
    if(@impedance_analy.entry_type== "manual")
      @impedance_analy.equipment_table.dummy = "proforma_confirmed"
      @impedance_analy.equipment_table.equipname = @impedance_analy.dummy1
      @impedance_analy.equipment_table.pay = @impedance_analy.amount
      @impedance_analy.equipment_table.username = @impedance_analy.dummy2
      @impedance_analy.equipment_table.debit_head = @impedance_analy.debit
      @impedance_analy.equipment_table.role = @impedance_analy.dummy3
      @impedance_analy.dummy2 = nil
      @impedance_analy.dummy3 = nil
    else
      @impedance_analy.equipment_table.sample = @impedance_analy.sample
    @impedance_analy.equipment_table.contact_no = @impedance_analy.user.contact
    uploaded_files = params[:impedance_analy][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @impedance_analy.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @impedance_analy.equipment_table.dummy = "alloted"
    @impedance_analy.equipment_table.username = @impedance_analy.user.name
    @impedance_analy.equipment_table.equipname = "Impedance Analyzer"
    @impedance_analy.equipment_table.debit_head = @impedance_analy.debit
    @impedance_analy.equipment_table.role = @impedance_analy.user.role
    @impedance_analy.equipment_table.email = @impedance_analy.user.email
    @impedance_analy.equipment_table.dept = @impedance_analy.user.department
    @impedance_analy.equipment_table.profesion = @impedance_analy.user.profession
    @impedance_analy.equipment_table.orgname = @impedance_analy.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Impedance Analyzer").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @impedance_analy.save
        if  @impedance_analy.expresssample.present?
           equiplist = Equiplist.where(name: "Impedance Analyzer").first
           equiplist.expressslot =equiplist.expressslot- @impedance_analy.expresssample
           equiplist.save
        end
        if @impedance_analy.user.role=='student'||@impedance_analy.user.role=='faculty'
          ImpedanceAnalyzerMailer.with(id:@impedance_analy.id, userid:current_user.id).InternalMail.deliver_later
        else
          ImpedanceAnalyzerMailer.with(id:@impedance_analy.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @impedance_analy.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "impedance_analy was successfully created." }
          format.json { render :show, status: :created, location: @impedance_analy }
      else
        format.html { redirect_to home_index_path, notice: "Impedance analy was successfully created." }
        format.json { render :show, status: :created, location: @impedance_analy }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @impedance_analy.errors, status: :unprocessable_entity }
      end
end
end

  # PATCH/PUT /impedance_analies/1 or /impedance_analies/1.json
  def update
      @impedance_analy.status="alloted"

    respond_to do |format|
      if @impedance_analy.update(impedance_analy_params)
        if @impedance_analy.status!= 'completed'
          ImpedanceAnalyzerAllotedMailer.with(id:@impedance_analy.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_impdeance_path(@impedance_analy), notice: "Impedance analy was successfully updated." }
        format.json { render :show, status: :ok, location: @impedance_analy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @impedance_analy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impedance_analies/1 or /impedance_analies/1.json
  def destroy
    @impedance_analy.destroy

    respond_to do |format|
      format.html { redirect_to impedance_analies_url, notice: "Impedance analy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impedance_analy
      @impedance_analy = ImpedanceAnaly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def impedance_analy_params
      params.require(:impedance_analy).permit(:sample, :composition, :capacitance, :dielectric, :iv, :freqrange, :currentrange, :voltagerange, :impedance, :more, :debit, :slotdate, :slottime, :status,:losstangent,:user_id,:entry_type, :amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] , measurement: [],references: [])
    end
end
