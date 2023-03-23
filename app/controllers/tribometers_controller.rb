class TribometersController < ApplicationController
  before_action :set_tribometer, only: %i[ show edit update destroy ]

  # GET /tribometers or /tribometers.json
  def index
    @tribometers = Tribometer.all
  end

  # GET /tribometers/1 or /tribometers/1.json
  def show
  end

  # GET /tribometers/new
  def new
    @user=User.find(params[:id])
    @tribometer = Tribometer.new

  end

  # GET /tribometers/1/edit
  def edit
  end

  # POST /tribometers or /tribometers.json
  def create
    @tribometer = Tribometer.new(tribometer_params)
    @tribometer.user=current_user
    @tribometer.status="pending"

    respond_to do |format|
      if @tribometer.save
        if @tribometer.user.role=='student'||@tribometer.user.role=='faculty'
          TribometerMailer.with(id:@tribometer.id, userid:current_user.id).InternalMail.deliver_later
        else
          TribometerMailer.with(id:@tribometer.id, userid:current_user.id).ExternalMail.deliver_later
        end 
        format.html { redirect_to tribometer_url(@tribometer), notice: "Tribometer was successfully created." }
        format.json { render :show, status: :created, location: @tribometer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tribometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tribometers/1 or /tribometers/1.json
  def update
    @tribometer.status="alloted"
    respond_to do |format|
      if @tribometer.update(tribometer_params)
        if @tribometer.amount == nil
        TribometerAllotedMailer.with(id:@tribometer.id, userid:current_user.id).Mail.deliver_later
      else
        PaymentTribometerMailer.with(id:@tribometer.id, userid:current_user.id).Mail.deliver_later
      end
          @tribometer.status="alloted"
        format.html { redirect_to slotbooker_trib_path(@tribometer), notice: "Tribometer was successfully updated." }
        format.json { render :show, status: :ok, location: @tribometer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tribometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tribometers/1 or /tribometers/1.json
  def destroy
    @tribometer.destroy

    respond_to do |format|
      format.html { redirect_to tribometers_url, notice: "Tribometer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tribometer
      @tribometer = Tribometer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tribometer_params
      params.require(:tribometer).permit(:sample, :measurement, :stype, :temp_req, :loading, :indenter, :stroke, :more,:user_id,:status,:slotdate,:slottime,:debit,references: [])
    end
end
