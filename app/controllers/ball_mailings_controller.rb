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


    respond_to do |format|
      if @ball_mailing.save
        if @ball_mailing.user.role=='student'||@ball_mailing.user.role=='faculty'
          BallMailingMailer.with(id:@ball_mailing.id, userid:current_user.id).InternalMail.deliver_later
        else
          BallMailingMailer.with(id:@ball_mailing.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Ball mailing was successfully created." }
        format.json { render :show, status: :created, location: @ball_mailing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ball_mailing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ball_mailings/1 or /ball_mailings/1.json
  def update
    @ball_mailing.status="alloted"
    @ball_mailing.build_equipment_table
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
      params.require(:ball_mailing).permit(:sample, :feed, :btype, :grind, :specify, :size, :grinding, :speed, :hardness, :toxicity, :compatibility, :more, :status, :slotdate, :slottime, :debit, :user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
