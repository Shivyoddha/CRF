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

    respond_to do |format|
      if @bet.save
        if @bet.user.role=='student'||@bet.user.role=='faculty'
          BetMailer.with(id:@bet.id, userid:current_user.id).InternalMail.deliver_later
        else
          BetMailer.with(id:@bet.id, userid:current_user.id).ExternalMail.deliver_later
      end
      format.html { redirect_to home_index_path, notice: "Bet was successfully created." }
      format.json { render :show, status: :created, location: @bet }
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
        BetAllotedMailer.with(id:@bet.id, userid:current_user.id).Mail.deliver_later
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
      params.require(:bet).permit(:sample, :degassing, :incompatibe, :toxicity, :disposal, :more,:analysiscustom,:analysisstandard,:debit, :slotdate, :slottime, :status,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress] , references: [])
    end
end
