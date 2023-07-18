class BallMailingsController < ApplicationController
  before_action :set_ball_mailing, only: %i[ show edit update destroy ]

  # GET /ball_mailings or /ball_mailings.json
  def index
    @ball_mailings = BallMailing.all
  end

  # GET /ball_mailings/1 or /ball_mailings/1.json
  def show
  end

  # GET /ball_mailings/new
  def new
    @ball_mailing = BallMailing.new
    @ball_mailing.build_equipment_table
    @slot_type = params[:slot_type]
   @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Ball Milling Unit").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Ball Milling Unit").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Ball Milling Unit").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /ball_mailings/1/edit
  def edit
  end

  # POST /ball_mailings or /ball_mailings.json
  def create
    @ball_mailing = BallMailing.new(ball_mailing_params)
    @ball_mailing.user=current_user
    @ball_mailing.status="pending"
    @ball_mailing.build_equipment_table
    if(@ball_mailing.entry_type== "manual")
      @ball_mailing.equipment_table.dummy = "proforma_confirmed"
      @ball_mailing.equipment_table.equipname = @ball_mailing.dummy1
      @ball_mailing.equipment_table.pay = @ball_mailing.amount
      @ball_mailing.equipment_table.username = @ball_mailing.dummy2
      @ball_mailing.equipment_table.debit_head = @ball_mailing.debit
      @ball_mailing.equipment_table.role = @ball_mailing.dummy3
      @ball_mailing.dummy2 = nil
      @ball_mailing.dummy3 = nil
    else
      @ball_mailing.equipment_table.sample = @ball_mailing.sample
    @ball_mailing.equipment_table.contact_no = @ball_mailing.user.contact
    uploaded_files = params[:ball_mailing][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @ball_mailing.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @ball_mailing.equipment_table.dummy = "alloted"
    @ball_mailing.equipment_table.username = @ball_mailing.user.name
    @ball_mailing.equipment_table.equipname = "Ball Milling Unit"
    @ball_mailing.equipment_table.app_no = @ball_mailing.id
    @ball_mailing.equipment_table.debit_head = @ball_mailing.debit
    @ball_mailing.equipment_table.role = @ball_mailing.user.role
    @ball_mailing.equipment_table.email = @ball_mailing.user.email
    @ball_mailing.equipment_table.dept = @ball_mailing.user.department
    @ball_mailing.equipment_table.profesion = @ball_mailing.user.profession
    @ball_mailing.equipment_table.orgname = @ball_mailing.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Ball Milling Unit").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }


    respond_to do |format|
      if @ball_mailing.save
        if  @ball_mailing.expresssample.present?
         equiplist = Equiplist.where(name: "Ball Milling Unit").first
         equiplist.expressslot =equiplist.expressslot- @ball_mailing.expresssample
         equiplist.save
        end
        if @ball_mailing.user.role=='student'||@ball_mailing.user.role=='faculty'
          BallMailingMailer.with(id:@ball_mailing.id, userid:current_user.id).InternalMail.deliver_later
        else
          BallMailingMailer.with(id:@ball_mailing.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @ball_mailing.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "ball_mailing was successfully created." }
            format.json { render :show, status: :created, location: @ball_mailing }
        else
        format.html { redirect_to home_index_path, notice: "Ball mailing was successfully created." }
        format.json { render :show, status: :created, location: @ball_mailing }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ball_mailing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ball_mailings/1 or /ball_mailings/1.json
  def update
    @ball_mailing.status="alloted"
    respond_to do |format|
      if @ball_mailing.update(ball_mailing_params)
        if @ball_mailing.status!= 'completed'
          BallMailingAllotedMailer.with(id:@ball_mailing.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_ball_path(@ball_mailing), notice: "Ball mailing was successfully updated." }
        format.json { render :show, status: :ok, location: @ball_mailing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ball_mailing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ball_mailings/1 or /ball_mailings/1.json
  def destroy
    @ball_mailing.destroy

    respond_to do |format|
      format.html { redirect_to ball_mailings_url, notice: "Ball mailing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ball_mailing
      @ball_mailing = BallMailing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ball_mailing_params
      params.require(:ball_mailing).permit(:sample, :feed, :btype, :grind, :specify, :size, :grinding, :speed, :hardness, :toxicity, :compatibility, :more, :status, :slotdate, :slottime, :debit, :user_id,:entry_type, :amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
