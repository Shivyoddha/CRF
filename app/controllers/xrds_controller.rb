class XrdsController < ApplicationController
  before_action :set_xrd, only: %i[ show edit update destroy ]

  # GET /xrds or /xrds.json
  def index
    @xrds = Xrd.all
  end

  # GET /xrds/1 or /xrds/1.json
  def show

  end

  # GET /xrds/new
  def new
    @user=User.find(params[:id])
    @xrd = Xrd.new()
    @xrd.build_equipment_table
  end

  # GET /xrds/1/edit
  def edit
  end

  # POST /xrds or /xrds.json
  def create
    @xrd = Xrd.new(xrd_params)
    @xrd.user=current_user
    @xrd.status="pending"
    @xrd.build_equipment_table

    respond_to do |format|
      if @xrd.save
        if @xrd.user.role=='student'||@xrd.user.role=='faculty'
          XRayDiffractionMailer.with(id:@xrd.id, userid:current_user.id).InternalMail.deliver_later
        else
          XRayDiffractionMailer.with(id:@xrd.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Xrd was successfully created." }
        format.json { render :show, status: :created, location: @xrd }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @xrd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xrds/1 or /xrds/1.json
  def update
     @xrd.status="alloted"
    @xrd.build_equipment_table

    respond_to do |format|
      if @xrd.update(xrd_params)
        if @xrd.status!= 'completed'
          XrdAllotedMailer.with(id:@xrd.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_xrd_path, notice: "Xrd was successfully updated."}
        format.json { render :show, status: :ok, location: @xrd }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @xrd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xrds/1 or /xrds/1.json
  def destroy
    @xrd.destroy

    respond_to do |format|
      format.html { redirect_to xrds_url, notice: "Xrd was successfully destroyed."}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xrd
      @xrd = Xrd.find(params[:id])
    end

   # Only allow a list of trusted parameters through.
    def xrd_params
      params.require(:xrd).permit(:sample, :measurement, :composition, :stype, :mind, :maxd,:more, :debit, :slotdate, :slottime, :status, :amount,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] ,references: [])
    end
end
