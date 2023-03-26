class FtNmsController < ApplicationController
  before_action :set_ft_nm, only: %i[ show edit update destroy ]

  # GET /ft_nms or /ft_nms.json
  def index
    @ft_nms = FtNm.all
  end

  # GET /ft_nms/1 or /ft_nms/1.json
  def show
  end

  # GET /ft_nms/new
  def new
    @ft_nm = FtNm.new
  end

  # GET /ft_nms/1/edit
  def edit
  end

  # POST /ft_nms or /ft_nms.json
  def create
    @ft_nm = FtNm.new(ft_nm_params)
    @ft_nm.user=current_user
    @ft_nm.status="pending"
    respond_to do |format|
      if @ft_nm.save
        if @ft_nm.user.role=='student'||@ft_nm.user.role=='faculty'
          FtNmrMailer.with(id:@ft_nm.id, userid:current_user.id).InternalMail.deliver_later
        else
          FtNmrMailer.with(id:@ft_nm.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to ft_nm_url(@ft_nm), notice: "Ft nm was successfully created." }
        format.json { render :show, status: :created, location: @ft_nm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ft_nm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ft_nms/1 or /ft_nms/1.json
  def update
      @ft_nm.status="alloted"
    respond_to do |format|
      if @ft_nm.update(ft_nm_params)
        format.html { redirect_to slotbooker_ftnmr_path(@ft_nm), notice: "Ft nm was successfully updated." }
        format.json { render :show, status: :ok, location: @ft_nm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ft_nm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ft_nms/1 or /ft_nms/1.json
  def destroy
    @ft_nm.destroy

    respond_to do |format|
      format.html { redirect_to ft_nms_url, notice: "Ft nm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ft_nm
      @ft_nm = FtNm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ft_nm_params
      params.require(:ft_nm).permit(:sample, :nature, :phase, :solvent1,  :solvent2,  :solvent3,  :solvent4, :solvent5,:temp, :toxicity, :health, :more, :debit, :slotdate, :slottime, :status,:user_id,references: [],hazardmethod: [],measurement1:[],measurement2:[],measurement3:[],measurement4:[],measurement5:[])
    end
end
