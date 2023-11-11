class SparkOsController < ApplicationController
  before_action :set_spark_o, only: %i[ show edit update destroy ]

  # GET /spark_os or /spark_os.json
  def index
    @spark_os = SparkO.all
  end

  # GET /spark_os/1 or /spark_os/1.json
  def show
  end

  # GET /spark_os/new
  def new
    @spark_o = SparkO.new
    @spark_o.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Spark-OES").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Spark-OES").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Spark-OES").pluck(:expressend).first&.strftime("%d/%m/%Y")
  end

  # GET /spark_os/1/edit
  def edit
  end

  # POST /spark_os or /spark_os.json
  def create
    @spark_o = SparkO.new(spark_o_params)
    @spark_o.user=current_user
    @spark_o.status="pending"
    @spark_o.build_equipment_table
    if(@spark_o.entry_type== "manual")
  @spark_o.equipment_table.dummy = "proforma_confirmed"
  @spark_o.equipment_table.equipname = @spark_o.dummy1
  @spark_o.equipment_table.pay = @spark_o.amount
  @spark_o.equipment_table.username = @spark_o.dummy2
  @spark_o.equipment_table.debit_head = @spark_o.debit
  @spark_o.equipment_table.role = @spark_o.dummy3
  @spark_o.dummy2 = nil
  @spark_o.dummy3 = nil
else
      @spark_o.equipment_table.sample = @spark_o.sample
    @spark_o.equipment_table.contact_no = @spark_o.user.contact
    uploaded_files = params[:spark_o][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @spark_o.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @spark_o.equipment_table.dummy = "alloted"
    @spark_o.equipment_table.username = @spark_o.user.name
    @spark_o.equipment_table.equipname = "Spark-OES"
    @spark_o.equipment_table.app_no = @spark_o.id
    @spark_o.equipment_table.debit_head = @spark_o.debit
    @spark_o.equipment_table.role = @spark_o.user.role
    @spark_o.equipment_table.email = @spark_o.user.email
    @spark_o.equipment_table.dept = @spark_o.user.department
    @spark_o.equipment_table.profesion = @spark_o.user.profession
    @spark_o.equipment_table.orgname = @spark_o.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Spark-OES").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @spark_o.save
        if  @spark_o.expresssample.present?
         equiplist = Equiplist.where(name: "Spark-OES").first
         equiplist.expressslot =equiplist.expressslot- @spark_o.expresssample
         equiplist.save
        end
        if @spark_o.user.role=='student'||@spark_o.user.role=='faculty'
          SparkOMailer.with(id:@spark_o.id, userid:current_user.id).InternalMail.deliver_later
        else
          SparkOMailer.with(id:@spark_o.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @spark_o.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "spark_o was successfully created." }
            format.json { render :show, status: :created, location: @spark_o }
        else
        format.html { redirect_to home_index_path, notice: "Spark o was successfully created." }
        format.json { render :show, status: :created, location: @spark_o }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spark_o.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spark_os/1 or /spark_os/1.json
  def update
      @spark_o.status="alloted"

    respond_to do |format|
      if @spark_o.update(spark_o_params)
        if @spark_o.status!= 'completed'
          SparkOAllotedMailer.with(id:@spark_o.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_spark_path(@spark_o), notice: "Spark o was successfully updated." }
        format.json { render :show, status: :ok, location: @spark_o }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spark_o.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spark_os/1 or /spark_os/1.json
  def destroy
    @spark_o.destroy

    respond_to do |format|
      format.html { redirect_to spark_os_url, notice: "Spark o was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spark_o
      @spark_o = SparkO.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spark_o_params
      params.require(:spark_o).permit(:sample, :composition, :samplefe, :sampleni, :samplezn, :samplesn, :samplecu, :sampleti, :sampleal, :samplepb, :samplemg, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname], references: [])
    end
end
