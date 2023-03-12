class MicroEdmsController < ApplicationController
  before_action :set_micro_edm, only: %i[ show edit update destroy ]

  # GET /micro_edms or /micro_edms.json
  def index
    @micro_edms = MicroEdm.all
  end

  # GET /micro_edms/1 or /micro_edms/1.json
  def show
  end

  # GET /micro_edms/new
  def new
    @micro_edm = MicroEdm.new
    @micro_edm.build_equipment_table

  end

  # GET /micro_edms/1/edit
  def edit
  end

  # POST /micro_edms or /micro_edms.json
  def create
    @micro_edm = MicroEdm.new(micro_edm_params)
    @micro_edm.build_equipment_table

    respond_to do |format|
      if @micro_edm.save
        MicroEdmMailer.with(id:@micro_edm.id, userid:current_user.id).Mail.deliver_later

        format.html { redirect_to micro_edm_url(@micro_edm), notice: "Micro edm was successfully created." }
        format.json { render :show, status: :created, location: @micro_edm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micro_edm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /micro_edms/1 or /micro_edms/1.json
  def update
    @micro_edm.build_equipment_table

    respond_to do |format|
      if @micro_edm.update(micro_edm_params)
        format.html { redirect_to micro_edm_url(@micro_edm), notice: "Micro edm was successfully updated." }
        format.json { render :show, status: :ok, location: @micro_edm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micro_edm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /micro_edms/1 or /micro_edms/1.json
  def destroy
    @micro_edm.destroy

    respond_to do |format|
      format.html { redirect_to micro_edms_url, notice: "Micro edm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micro_edm
      @micro_edm = MicroEdm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def micro_edm_params
      params.require(:micro_edm).permit(:sample, :composition, :toolelectrode, :toolmaterial, :milling, :turning, :drilling, :edm, :edg, :more, :debit, :slotdate, :slottime, :status, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay])
    end
end
