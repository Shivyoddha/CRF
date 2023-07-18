class GloveBoxesController < ApplicationController
  before_action :set_glove_box, only: %i[ show edit update destroy ]

  # GET /glove_boxes or /glove_boxes.json
  def index
    @glove_boxes = GloveBox.all
  end

  # GET /glove_boxes/1 or /glove_boxes/1.json
  def show
  end

  # GET /glove_boxes/new
  def new
    @glove_box = GloveBox.new
    @glove_box.build_equipment_table

  end

  # GET /glove_boxes/1/edit
  def edit
  end

  # POST /glove_boxes or /glove_boxes.json
  def create
    @glove_box = GloveBox.new(glove_box_params)
    @glove_box.user=current_user
    @glove_box.status="pending"
    @glove_box.build_equipment_table
    if(@glove_box.entry_type== "manual")
      @glove_box.equipment_table.dummy = "proforma_confirmed"
      @glove_box.equipment_table.equipname = @glove_box.dummy1
      @glove_box.equipment_table.pay = @glove_box.amount
      @glove_box.equipment_table.username = @glove_box.dummy2
      @glove_box.equipment_table.debit_head = @glove_box.debit
      @glove_box.equipment_table.role = @glove_box.dummy3
      @glove_box.dummy2 = nil
      @glove_box.dummy3 = nil
    else
      @glove_box.equipment_table.sample = @glove_box.sample
    @glove_box.equipment_table.contact_no = @glove_box.user.contact
    uploaded_files = params[:glove_box][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @glove_box.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @glove_box.equipment_table.dummy = "alloted"
    @glove_box.equipment_table.username = @glove_box.user.name
    @glove_box.equipment_table.equipname = "glove_box"
    @glove_box.equipment_table.app_no = @glove_box.id
    @glove_box.equipment_table.debit_head = @glove_box.debit
    @glove_box.equipment_table.role = @glove_box.user.role
    @glove_box.equipment_table.email = @glove_box.user.email
    @glove_box.equipment_table.dept = @glove_box.user.department
    @glove_box.equipment_table.profesion = @glove_box.user.profession
    @glove_box.equipment_table.orgname = @glove_box.user.orgname
  end

    respond_to do |format|
      if @glove_box.save
        if @glove_box.user.role=='student'||@glove_box.user.role=='faculty'
          GloveBoxMailer.with(id:@glove_box.id, userid:current_user.id).InternalMail.deliver_later
        else
          GloveBoxMailer.with(id:@glove_box.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @glove_box.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "glove_box was successfully created." }
            format.json { render :show, status: :created, location: @glove_box }
        else
        format.html { redirect_to home_index_path, notice: "Glove box was successfully created." }
        format.json { render :show, status: :created, location: @glove_box }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @glove_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glove_boxes/1 or /glove_boxes/1.json
  def update
      @glove_box.status="alloted"

    respond_to do |format|
      if @glove_box.update(glove_box_params)
        if @glove_box.status!= 'completed'
          GloveBoxAllotedMailer.with(id:@glove_box.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_glove_path(@glove_box), notice: "Glove box was successfully updated." }
        format.json { render :show, status: :ok, location: @glove_box }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @glove_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glove_boxes/1 or /glove_boxes/1.json
  def destroy
    @glove_box.destroy

    respond_to do |format|
      format.html { redirect_to glove_boxes_url, notice: "Glove box was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glove_box
      @glove_box = GloveBox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def glove_box_params
      params.require(:glove_box).permit(:weight, :days, :toxicity, :carcinogenic, :incompatible, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
