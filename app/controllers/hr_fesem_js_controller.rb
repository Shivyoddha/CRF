class HrFesemJsController < ApplicationController
  before_action :set_hr_fesem_j, only: %i[ show edit update destroy ]

  # GET /hr_fesem_js or /hr_fesem_js.json
  def index
    @hr_fesem_js = HrFesemJ.all
  end

  # GET /hr_fesem_js/1 or /hr_fesem_js/1.json
  def show
  end

  # GET /hr_fesem_js/new
  def new
    @hr_fesem_j = HrFesemJ.new
    @user=current_user
    @hr_fesem_j.build_equipment_table
  end

  # GET /hr_fesem_js/1/edit
  def edit
  end

  # POST /hr_fesem_js or /hr_fesem_js.json
  def create
   @hr_fesem_j = HrFesemJ.new(hr_fesem_j_params)
    @hr_fesem_j.user=current_user
    @hr_fesem_j.status="pending"
    @hr_fesem_j.build_equipment_table
    @hr_fesem_j.equipment_table.dummy = "alloted"
    @hr_fesem_j.equipment_table.username = @hr_fesem_j.user.name
    @hr_fesem_j.equipment_table.equipname = "HR-FESEM [Jeol]"
    @hr_fesem_j.equipment_table.app_no = @hr_fesem_j.id
    @hr_fesem_j.equipment_table.debit_head = @hr_fesem_j.debit
    @hr_fesem_j.equipment_table.role = @hr_fesem_j.user.role
    @hr_fesem_j.equipment_table.email = @hr_fesem_j.user.email
    @hr_fesem_j.equipment_table.dept = @hr_fesem_j.user.department
    @hr_fesem_j.equipment_table.profesion = @hr_fesem_j.user.profession
    @hr_fesem_j.equipment_table.orgname = @hr_fesem_j.user.orgname

    respond_to do |format|
     if @hr_fesem_j.save
       if @hr_fesem_j.user.role=='student'||@hr_fesem_j.user.role=='faculty'
         HrFesemJMailer.with(id:@hr_fesem_j.id, userid:current_user.id).InternalMail.deliver_later

       else
         HrFesemJMailer.with(id:@hr_fesem_j.id, userid:current_user.id).ExternalMail.deliver_later

       end
       format.html { redirect_to home_index_path, notice: "Hr fesem j was successfully created." }
       format.json { render :show, status: :created, location: @hr_fesem_j }
     else
       format.html { render :new, status: :unprocessable_entity }
       format.json { render json: @hr_fesem_j.errors, status: :unprocessable_entity }
     end
   end
 end


  # PATCH/PUT /hr_fesem_js/1 or /hr_fesem_js/1.json
  def update
    @hr_fesem_j.status="alloted"
    @hr_fesem_j.build_equipment_table
    respond_to do |format|
      if @hr_fesem_j.update(hr_fesem_j_params)
        if @hr_fesem_j.status!= 'completed'
          HrFesemJAllotedMailer.with(id:@hr_fesem_j.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_fesemj_path, notice: "Hr fesem j was successfully updated." }
        format.json { render :show, status: :ok, location: @hr_fesem_j }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hr_fesem_j.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_fesem_js/1 or /hr_fesem_js/1.json
  def destroy
    @hr_fesem_j.destroy

    respond_to do |format|
      format.html { redirect_to hr_fesem_js_url, notice: "Hr fesem j was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hr_fesem_j
      @hr_fesem_j = HrFesemJ.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hr_fesem_j_params
      params.require(:hr_fesem_j).permit(:sample, :composition, :stype, :sphase, :measurement, :eds_required,:status, :user_id, :slottime, :slotdate, :toxic, :conducting, :more, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] ,references: [])
    end
end
