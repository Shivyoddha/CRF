class HrFesemCsController < ApplicationController
  before_action :set_hr_fesem_c, only: %i[ show edit update destroy ]

  # GET /hr_fesem_cs or /hr_fesem_cs.json
  def index
    @hr_fesem_cs = HrFesemC.all
  end

  # GET /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def show
  end

  # GET /hr_fesem_cs/new
  def new
    @hr_fesem_c = HrFesemC.new
    @user=User.find(params[:id])
    @hr_fesem_c.build_equipment_table

  end

  # GET /hr_fesem_cs/1/edit
  def edit
  end

  # POST /hr_fesem_cs or /hr_fesem_cs.json
  def create
    @hr_fesem_c = HrFesemC.new(hr_fesem_c_params)
    @hr_fesem_c.user=current_user
    @hr_fesem_c.status="pending"
    @hr_fesem_c.build_equipment_table
    respond_to do |format|
      if @hr_fesem_c.save
        if @hr_fesem_c.user.role=='student'||@hr_fesem_c.user.role=='faculty'
          HrFesemCMailer.with(id:@hr_fesem_c.id, userid:current_user.id).InternalMail.deliver_later
        else
          HrFesemCMailer.with(id:@hr_fesem_c.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Hr fesem c was successfully created." }
        format.json { render :show, status: :created, location: @hr_fesem_c }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hr_fesem_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def update
    @hr_fesem_c.status="alloted"
    @hr_fesem_c.build_equipment_table
    respond_to do |format|
      if @hr_fesem_c.update(hr_fesem_c_params)
      HrFesemCAllotedMailer.with(id:@hr_fesem_c.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_fesemc_path(@hr_fesem_c), notice: "Hr fesem c was successfully updated." }
        format.json { render :show, status: :ok, location: @hr_fesem_c }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hr_fesem_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def destroy
    @hr_fesem_c.destroy

    respond_to do |format|
      format.html { redirect_to hr_fesem_cs_url, notice: "Hr fesem c was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hr_fesem_c
      @hr_fesem_c = HrFesemC.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hr_fesem_c_params
      params.require(:hr_fesem_c).permit(:sample, :composition, :stype, :sphase, :measurement, :eds_required, :toxic, :conducting, :more, :debit, :slotdate, :slottime, :user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email] , references: [])
    end
end
