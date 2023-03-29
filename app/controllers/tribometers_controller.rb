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
    @tribometer.build_equipment_table

  end

  # GET /tribometers/1/edit
  def edit
  end

  # POST /tribometers or /tribometers.json
  def create
    @tribometer = Tribometer.new(tribometer_params)
    @tribometer.user=current_user
    @tribometer.status="pending"
    @tribometer.build_equipment_table

    respond_to do |format|
      if @tribometer.save
        if @tribometer.user.role=='student'||@tribometer.user.role=='faculty'
          TribometerMailer.with(id:@tribometer.id, userid:current_user.id).InternalMail.deliver_later
        else
          TribometerMailer.with(id:@tribometer.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Tribometer was successfully created." }
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
    @tribometer.build_equipment_table

    respond_to do |format|
      if @tribometer.update(tribometer_params)
        TribometerAllotedMailer.with(id:@tribometer.id, userid:current_user.id).Mail.deliver_later
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
      params.require(:tribometer).permit(:sample, :measurement, :stype, :temp_req, :loading, :indenter, :stroke, :more,:user_id,:status,:slotdate,:slottime,:debit,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],references: [])
    end
end
