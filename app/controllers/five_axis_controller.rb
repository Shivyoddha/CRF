class FiveAxisController < ApplicationController
  before_action :set_five_axi, only: %i[ show edit update destroy ]

  # GET /five_axis or /five_axis.json
  def index
    @five_axis = FiveAxi.all
  end

  # GET /five_axis/1 or /five_axis/1.json
  def show
  end

  # GET /five_axis/new
  def new
    @five_axi = FiveAxi.new()
    @five_axi.build_equipment_table
  end

  # GET /five_axis/1/edit
  def edit
  end

  # POST /five_axis or /five_axis.json
  def create
    @five_axi = FiveAxi.new(five_axi_params)
    @five_axi.user=current_user
    @five_axi.status="pending"
    @five_axi.build_equipment_table
    respond_to do |format|
      if @five_axi.save
        if @five_axi.user.role=='student'||@five_axi.user.role=='faculty'
          FiveAxiMailer.with(id:@five_axi.id, userid:current_user.id).InternalMail.deliver_later
        else
          FiveAxiMailer.with(id:@five_axi.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Five axi was successfully created." }
        format.json { render :show, status: :created, location: @five_axi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @five_axi.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /five_axis/1 or /five_axis/1.json
  def update
      @five_axi.status="alloted"
      @five_axi.build_equipment_table
    respond_to do |format|
      if @five_axi.update(five_axi_params)
        if @five_axi.status!= 'completed'
          FiveAxiAllotedMailer.with(id:@five_axi.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_fiveaxis_path(@five_axi), notice: "Five axi was successfully updated." }
        format.json { render :show, status: :ok, location: @five_axi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @five_axi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /five_axis/1 or /five_axis/1.json
  def destroy
    @five_axi.destroy

    respond_to do |format|
      format.html { redirect_to five_axis_url, notice: "Five axi was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_five_axi
      @five_axi = FiveAxi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def five_axi_params
      params.require(:five_axi).permit(:sample, :material, :depth, :operation, :tool, :specimentolerance, :cncprogram, :rotationalspeed, :feedrate, :more, :debit, :slotdate, :slottime, :status,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
