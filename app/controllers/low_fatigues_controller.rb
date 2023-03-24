class LowFatiguesController < ApplicationController
  before_action :set_low_fatigue, only: %i[ show edit update destroy ]

  # GET /low_fatigues or /low_fatigues.json
  def index
    @low_fatigues = LowFatigue.all
  end

  # GET /low_fatigues/1 or /low_fatigues/1.json
  def show
  end

  # GET /low_fatigues/new
  def new
    @user=User.find(params[:id])
    @low_fatigue = LowFatigue.new
    @low_fatigue.build_equipment_table

  end

  # GET /low_fatigues/1/edit
  def edit
  end

  # POST /low_fatigues or /low_fatigues.json
  def create
    @low_fatigue = LowFatigue.new(low_fatigue_params)
    @low_fatigue.user=current_user
    @low_fatigue.status="pending"
    @low_fatigue.build_equipment_table

    respond_to do |format|
      if @low_fatigue.save
        if @low_fatigue.user.role=='student'||@low_fatigue.user.role=='faculty'
          LowFatigueMailer.with(id:@low_fatigue.id, userid:current_user.id).InternalMail.deliver_later
        else
          LowFatigueMailer.with(id:@low_fatigue.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to low_fatigue_url(@low_fatigue), notice: "Low fatigue was successfully created." }
        format.json { render :show, status: :created, location: @low_fatigue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @low_fatigue.errors, status: :unprocessable_entity }
      end

  # PATCH/PUT /low_fatigues/1 or /low_fatigues/1.json
  def update
    @low_fatigue.status="alloted"
    @low_fatigue.build_equipment_table

    respond_to do |format|
      if @low_fatigue.update(low_fatigue_params)
        LowFatigueAllotedMailer.with(id:@low_fatigue.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to low_fatigue_url(@low_fatigue), notice: "Low fatigue was successfully updated." }
        format.json { render :show, status: :ok, location: @low_fatigue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @low_fatigue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /low_fatigues/1 or /low_fatigues/1.json
  def destroy
    @low_fatigue.destroy

    respond_to do |format|
      format.html { redirect_to low_fatigues_url, notice: "Low fatigue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_low_fatigue
      @low_fatigue = LowFatigue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def low_fatigue_params
      params.require(:low_fatigue).permit(:sample, :sc1, :st1, :tt1, :tf1, :sc2, :st2, :tt2, :tf2, :sc3, :st3, :tt3, :tf3, :sc4, :st4, :tt4, :tf4, :sc5, :st5, :tt5, :tf5, :more, :slottime, :slotdate, :status, :debit, :m1, :m2, :m3, :m4, :m5, :user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email] , references: [])
    end
end
