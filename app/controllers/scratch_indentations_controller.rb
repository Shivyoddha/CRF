class ScratchIndentationsController < ApplicationController
  before_action :set_scratch_indentation, only: %i[ show edit update destroy ]

  # GET /scratch_indentations or /scratch_indentations.json
  def index
    @scratch_indentations = ScratchIndentation.all
  end

  # GET /scratch_indentations/1 or /scratch_indentations/1.json
  def show
  end

  # GET /scratch_indentations/new
  def new
    @scratch_indentation = ScratchIndentation.new
    @scratch_indentation.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Scratch/Indentation Tester").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Scratch/Indentation Tester").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Scratch/Indentation Tester").pluck(:expressend).first&.strftime("%d/%m/%Y")
  end

  # GET /scratch_indentations/1/edit
  def edit
  end

  # POST /scratch_indentations or /scratch_indentations.json
  def create
    @scratch_indentation = ScratchIndentation.new(scratch_indentation_params)
    @scratch_indentation.user=current_user
    @scratch_indentation.status="pending"
    @scratch_indentation.build_equipment_table
    if(@scratch_indentation.entry_type== "manual")
      @scratch_indentation.equipment_table.dummy = "proforma_confirmed"
      @scratch_indentation.equipment_table.equipname = @scratch_indentation.dummy1
      @scratch_indentation.equipment_table.pay = @scratch_indentation.amount
      @scratch_indentation.equipment_table.username = @scratch_indentation.dummy2
      @scratch_indentation.equipment_table.debit_head = @scratch_indentation.debit
      @scratch_indentation.equipment_table.role = @scratch_indentation.dummy3
      @scratch_indentation.dummy2 = nil
      @scratch_indentation.dummy3 = nil
    else
      @scratch_indentation.equipment_table.sample = @scratch_indentation.sample
    @scratch_indentation.equipment_table.contact_no = @scratch_indentation.user.contact
    uploaded_files = params[:scratch_indentation][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @scratch_indentation.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @scratch_indentation.equipment_table.dummy = "alloted"
    @scratch_indentation.equipment_table.username = @scratch_indentation.user.name
    @scratch_indentation.equipment_table.equipname = "Scratch/Indentation Tester"
    @scratch_indentation.equipment_table.app_no = @scratch_indentation.id
    @scratch_indentation.equipment_table.debit_head = @scratch_indentation.debit
    @scratch_indentation.equipment_table.role = @scratch_indentation.user.role
    @scratch_indentation.equipment_table.email = @scratch_indentation.user.email
    @scratch_indentation.equipment_table.dept = @scratch_indentation.user.department
    @scratch_indentation.equipment_table.profesion = @scratch_indentation.user.profession
    @scratch_indentation.equipment_table.orgname = @scratch_indentation.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Scratch/Indentation Tester").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @scratch_indentation.save
        if  @scratch_indentation.expresssample.present?
         equiplist = Equiplist.where(name: "Scratch/Indentation Tester").first
         equiplist.expressslot =equiplist.expressslot- @scratch_indentation.expresssample
         equiplist.save
        end
        if @scratch_indentation.user.role=='student'||@scratch_indentation.user.role=='faculty'
          ScratchIndentationMailer.with(id:@scratch_indentation.id, userid:current_user.id).InternalMail.deliver_later
        else
          ScratchIndentationMailer.with(id:@scratch_indentation.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @scratch_indentation.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "scratch_indentation was successfully created." }
            format.json { render :show, status: :created, location: @scratch_indentation }
        else
        format.html { redirect_to home_index_path, notice: "Scratch indentation was successfully created." }
        format.json { render :show, status: :created, location: @scratch_indentation }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scratch_indentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scratch_indentations/1 or /scratch_indentations/1.json
  def update
    @scratch_indentation.status="alloted"

    respond_to do |format|
      if @scratch_indentation.update(scratch_indentation_params)
          if @scratch_indentation.status!= 'completed'
            ScratchIndentationAllotedMailer.with(id:@scratch_indentation.id, userid:current_user.id).Mail.deliver_later
          end
        format.html { redirect_to slotbooker_scratch_path(@scratch_indentation), notice: "Scratch indentation was successfully updated." }
        format.json { render :show, status: :ok, location: @scratch_indentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scratch_indentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scratch_indentations/1 or /scratch_indentations/1.json
  def destroy
    @scratch_indentation.destroy

    respond_to do |format|
      format.html { redirect_to scratch_indentations_url, notice: "Scratch indentation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scratch_indentation
      @scratch_indentation = ScratchIndentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scratch_indentation_params
      params.require(:scratch_indentation).permit(:sample, :stype, :measurement, :stroke, :number_indentation, :constant_load, :increment_load, :progressive_load, :temperature, :analysis, :more,:debit, :slotdate, :slottime, :status,:user_id,:entry_type,:dummy1,:dummy2,:dummy3,:amount,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:orgname], references: [])
    end
end
