class HrlcmsController < ApplicationController
  before_action :set_hrlcm, only: %i[ show edit update destroy ]

  # GET /hrlcms or /hrlcms.json
  def index
    @hrlcms = Hrlcm.all
  end

  # GET /hrlcms/1 or /hrlcms/1.json
  def show
  end

  # GET /hrlcms/new
  def new
    @hrlcm = Hrlcm.new
    @user=User.find(params[:id])
  end

  # GET /hrlcms/1/edit
  def edit
  end

  # POST /hrlcms or /hrlcms.json
  def create
    @hrlcm = Hrlcm.new(hrlcm_params)
    @hrlcm.user=current_user
    @hrlcm.status="pending"

    respond_to do |format|
      if @hrlcm.save
        HrLcmMailer.with(id:@hrlcm.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to hrlcm_url(@hrlcm), notice: "Hrlcm was successfully created." }
        format.json { render :show, status: :created, location: @hrlcm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hrlcm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hrlcms/1 or /hrlcms/1.json
  def update
    @hrlcm.status="alloted"
    respond_to do |format|
      if @hrlcm.update(hrlcm_params)
        if @hrlcm.amount == nil
        HrlcmAllotedMailer.with(id:@hrlcm.id, userid:current_user.id).Mail.deliver_later
      else
        PaymentHrlcmMailer.with(id:@hrlcm.id, userid:current_user.id).Mail.deliver_later
      end
        format.html { redirect_to slotbooker_lcms_path(@hrlcm), notice: "Hrlcm was successfully updated." }
        format.json { render :show, status: :ok, location: @hrlcm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hrlcm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hrlcms/1 or /hrlcms/1.json
  def destroy
    @hrlcm.destroy

    respond_to do |format|
      format.html { redirect_to hrlcms_url, notice: "Hrlcm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hrlcm
      @hrlcm = Hrlcm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hrlcm_params
      params.require(:hrlcm).permit(:sample, :nature_sample, :category, :sample_type, :solvent, :analysis, :sample_volume, :sample_concentration, :sample_salts, :sample_contains, :storage , :incompatible, :toxicity, :disposal, :health, :more, :testing_required, :status, :slotdate, :slottime, :debit,:user_id,references: [])
    end
end
