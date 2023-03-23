class IcpMsController < ApplicationController
  before_action :set_icp_m, only: %i[ show edit update destroy ]

  # GET /icp_ms or /icp_ms.json
  def index
    @icp_ms = IcpM.all
  end

  # GET /icp_ms/1 or /icp_ms/1.json
  def show
  end

  # GET /icp_ms/new
  def new
    @user=User.find(params[:id])
    @icp_m = IcpM.new()
  end

  # GET /icp_ms/1/edit
  def edit
  end

  # POST /icp_ms or /icp_ms.json
  def create
    @icp_m = IcpM.new(icp_m_params)
    @icp_m.user=current_user
    @icp_m.status="pending"


    respond_to do |format|
      if @icp_m.save
        if @icp_m.user.role=='student'||@icp_m.user.role=='faculty'
          IcpMsMailer.with(id:@icp_m.id, userid:current_user.id).InternalMail.deliver_later
        else
          IcpMsMailer.with(id:@icp_m.id, userid:current_user.id).ExternalMail.deliver_later
        end 
        format.html { redirect_to icp_m_url(@icp_m), notice: "Icp m was successfully created." }
        format.json { render :show, status: :created, location: @icp_m }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icp_m.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icp_ms/1 or /icp_ms/1.json
  def update
    @icp_m.status="alloted"
    respond_to do |format|
      if @icp_m.update(icp_m_params)
        if @icp_m.amount == nil
        IcpMAllotedMailer.with(id:@icp_m.id, userid:current_user.id).Mail.deliver_later
      else
        PaymentIcpMMailer.with(id:@icp_m.id, userid:current_user.id).Mail.deliver_later
      end
         @icp_m.status="alloted"
        format.html { redirect_to slotbooker_icp_path(@icp_m), notice: "Icp m was successfully updated." }
        format.json { render :show, status: :ok, location: @icp_m }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @icp_m.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icp_ms/1 or /icp_ms/1.json
  def destroy
    @icp_m.destroy

    respond_to do |format|
      format.html { redirect_to icp_ms_url, notice: "Icp m was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icp_m
      @icp_m = IcpM.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def icp_m_params
      params.require(:icp_m).permit(:sample, :composition, :sample_phase, :nature, :concentration, :testing, :temp, :toxicity, :compatibility, :hazard, :more, :debit, :status, :acid, :storage_condition, :slotdate, :slottime,:user_id ,references: [])
    end
end
