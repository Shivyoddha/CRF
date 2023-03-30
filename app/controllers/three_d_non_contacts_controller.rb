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
    respond_to do |format|
      if @three_d_non_contact.save
        if @three_d_non_contact.user.role=='student'||@three_d_non_contact.user.role=='faculty'
          ThreeDNonContactMailer.with(id:@three_d_non_contact.id, userid:current_user.id).InternalMail.deliver_later
        else
          ThreeDNonContactMailer.with(id:@three_d_non_contact.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Three d non contact was successfully created." }
        format.json { render :show, status: :created, location: @three_d_non_contact }
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
<<<<<<< HEAD
      params.require(:three_d_non_contact).permit(:status,:sample, :scant, :range, :stepinterval, :incompatible, :toxicity, :more, :debit, :xrange, :yrange,:user_id, :slottime, :slotdate,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email], references: [])
=======
      params.require(:three_d_non_contact).permit(:sample, :scant, :range, :stepinterval, :incompatible, :toxicity, :more, :debit, :xrange, :yrange,:user_id, :slottime, :slotdate,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname], references: [])
>>>>>>> 3a5c36457abb0bb6b8aaf5f51515b9b17ff1af62
    end
end
