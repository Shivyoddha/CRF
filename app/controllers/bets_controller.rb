class BetsController < ApplicationController
  before_action :set_bet, only: %i[ show edit update destroy ]

  # GET /bets or /bets.json
  def index
    @bets = Bet.all
  end

  # GET /bets/1 or /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    @bet = Bet.new
    @bet.build_equipment_table
  end

  # GET /bets/1/edit
  def edit
  end

  # POST /bets or /bets.json
  def create
    @bet = Bet.new(bet_params)
    @bet.user=current_user
    @bet.status="pending"
    @bet.build_equipment_table
    if(@bet.entry_type== "manual")
      @bet.equipment_table.dummy = "proforma_confirmed"
      @bet.equipment_table.equipname = @bet.dummy1
      @bet.equipment_table.pay = @bet.amount
      @bet.equipment_table.username = @bet.dummy2
      @bet.equipment_table.debit_head = @bet.debit
      @bet.equipment_table.role = @bet.dummy3
      @bet.dummy2 = nil
      @bet.dummy3 = nil
    else
    @bet.equipment_table.dummy = "alloted"
    @bet.equipment_table.username = @bet.user.name
    @bet.equipment_table.equipname = "BET Surface Area Analyzer"
    @bet.equipment_table.app_no = @bet.id
    @bet.equipment_table.debit_head = @bet.debit
    @bet.equipment_table.role = @bet.user.role
    @bet.equipment_table.email = @bet.user.email
    @bet.equipment_table.dept = @bet.user.department
    @bet.equipment_table.profesion = @bet.user.profession
    @bet.equipment_table.orgname = @bet.user.orgname
  end

    respond_to do |format|
      if @bet.save
        if @bet.user.role=='student'||@bet.user.role=='faculty'
          BetMailer.with(id:@bet.id, userid:current_user.id).InternalMail.deliver_later
        else
          BetMailer.with(id:@bet.id, userid:current_user.id).ExternalMail.deliver_later
      end
      if @bet.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "bet was successfully created." }
            format.json { render :show, status: :created, location: @bet }
        else
      format.html { redirect_to home_index_path, notice: "Bet was successfully created." }
      format.json { render :show, status: :created, location: @bet }
    end
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @bet.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /bets/1 or /bets/1.json
  def update
    @bet.status="alloted"
    @bet.build_equipment_table

    respond_to do |format|
      if @bet.update(bet_params)
        if @bet.status!= 'completed'
          BetAllotedMailer.with(id:@bet.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_bet_path(@bet), notice: "Bet was successfully updated." }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1 or /bets/1.json
  def destroy
    @bet.destroy

    respond_to do |format|
      format.html { redirect_to bets_url, notice: "Bet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bet_params
      params.require(:bet).permit(:sample, :degassing, :incompatibe, :toxicity, :disposal, :more,:analysiscustom,:analysisstandard,:debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
