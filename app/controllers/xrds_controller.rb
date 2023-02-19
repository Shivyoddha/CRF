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
    @xrd = Xrd.new
    @user=User.find(current_user.id)
  end

  # GET /xrds/1/edit
  def edit
  end

  # POST /xrds or /xrds.json
  def create
    @xrd = Xrd.new(xrd_params)
    respond_to do |format|
      if @xrd.save
        XRayDiffractionMailer.with(id:@xrd.id, userid:current_user.id).Mail.deliver_later
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
    respond_to do |format|
      if @xrd.update(xrd_params)

        format.html { redirect_to home_index_path, notice: "Xrd was successfully updated."}
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
      params.require(:xrd).permit(:sample, :measurement, :composition, :stype, :mind, :maxd,:more, :debit  ,references: [])
    end
end
