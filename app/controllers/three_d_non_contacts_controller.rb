class ThreeDNonContactsController < ApplicationController
  before_action :set_three_d_non_contact, only: %i[ show edit update destroy ]

  # GET /three_d_non_contacts or /three_d_non_contacts.json
  def index
    @three_d_non_contacts = ThreeDNonContact.all
  end

  # GET /three_d_non_contacts/1 or /three_d_non_contacts/1.json
  def show
  end

  # GET /three_d_non_contacts/new
  def new
    @three_d_non_contact = ThreeDNonContact.new
    @user=User.find(params[:id])
    @three_d_non_contact.build_equipment_table
  end

  # GET /three_d_non_contacts/1/edit
  def edit
  end

  # POST /three_d_non_contacts or /three_d_non_contacts.json
  def create
    @three_d_non_contact = ThreeDNonContact.new(three_d_non_contact_params)
    @three_d_non_contact.user=current_user
    @three_d_non_contact.status="pending"
    @three_d_non_contact.build_equipment_table
    if(@three_d_non_contact.entry_type== "manual")
  @three_d_non_contact.equipment_table.dummy = "proforma_confirmed"
  @three_d_non_contact.equipment_table.equipname = @three_d_non_contact.dummy1
  @three_d_non_contact.equipment_table.pay = @three_d_non_contact.amount
  @three_d_non_contact.equipment_table.username = @three_d_non_contact.dummy2
  @three_d_non_contact.equipment_table.debit_head = @three_d_non_contact.debit
  @three_d_non_contact.equipment_table.role = @three_d_non_contact.dummy3
  @three_d_non_contact.dummy2 = nil
  @three_d_non_contact.dummy3 = nil
else
    @three_d_non_contact.equipment_table.dummy = "alloted"
    @three_d_non_contact.equipment_table.username = @three_d_non_contact.user.name
    @three_d_non_contact.equipment_table.equipname = "3-D Non Contact Profilometer"
    @three_d_non_contact.equipment_table.app_no = @three_d_non_contact.id
    @three_d_non_contact.equipment_table.debit_head = @three_d_non_contact.debit
    @three_d_non_contact.equipment_table.role = @three_d_non_contact.user.role
    @three_d_non_contact.equipment_table.email = @three_d_non_contact.user.email
    @three_d_non_contact.equipment_table.dept = @three_d_non_contact.user.department
    @three_d_non_contact.equipment_table.profesion = @three_d_non_contact.user.profession
    @three_d_non_contact.equipment_table.orgname = @three_d_non_contact.user.orgname
  end

    respond_to do |format|
      if @three_d_non_contact.save
        if @three_d_non_contact.user.role=='student'||@three_d_non_contact.user.role=='faculty'
          ThreeDNonContactMailer.with(id:@three_d_non_contact.id, userid:current_user.id).InternalMail.deliver_later
        else
          ThreeDNonContactMailer.with(id:@three_d_non_contact.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @three_d_non_contact.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "three_d_non_contact was successfully created." }
            format.json { render :show, status: :created, location: @three_d_non_contact }
        else
        format.html { redirect_to home_index_path, notice: "Three d non contact was successfully created." }
        format.json { render :show, status: :created, location: @three_d_non_contact }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @three_d_non_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /three_d_non_contacts/1 or /three_d_non_contacts/1.json
  def update
    @three_d_non_contact.status="alloted"
    @three_d_non_contact.build_equipment_table

    respond_to do |format|
      if @three_d_non_contact.update(three_d_non_contact_params)
        if @three_d_non_contact.status!= 'completed'
        ThreeDNonContactAllotedMailer.with(id:@three_d_non_contact.id, userid:current_user.id).Mail.deliver_later
      end
        format.html { redirect_to slotbooker_threednon_path(@three_d_non_contact), notice: "Three d non contact was successfully updated." }
        format.json { render :show, status: :ok, location: @three_d_non_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @three_d_non_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /three_d_non_contacts/1 or /three_d_non_contacts/1.json
  def destroy
    @three_d_non_contact.destroy

    respond_to do |format|
      format.html { redirect_to three_d_non_contacts_url, notice: "Three d non contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_three_d_non_contact
      @three_d_non_contact = ThreeDNonContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def three_d_non_contact_params
      params.require(:three_d_non_contact).permit(:sample, :scant, :range, :stepinterval, :incompatible, :toxicity, :more, :debit, :xrange, :yrange,:user_id, :slottime, :slotdate, :entry_type,:amount,:dummy1,:dummy2,:dummy3,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname], references: [])
    end
end
