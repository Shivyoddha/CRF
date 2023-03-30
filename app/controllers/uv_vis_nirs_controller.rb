class UvVisNirsController < ApplicationController
  before_action :set_uv_vis_nir, only: %i[ show edit update destroy ]

  # GET /uv_vis_nirs or /uv_vis_nirs.json
  def index
    @uv_vis_nirs = UvVisNir.all
  end

  # GET /uv_vis_nirs/1 or /uv_vis_nirs/1.json
  def show
  end

  # GET /uv_vis_nirs/new
  def new
    @user=User.find(params[:id])
    @uv_vis_nir = UvVisNir.new
    @uv_vis_nir.build_equipment_table

  end

  # GET /uv_vis_nirs/1/edit
  def edit
  end

  # POST /uv_vis_nirs or /uv_vis_nirs.json
  def create
    @uv_vis_nir = UvVisNir.new(uv_vis_nir_params)
    @uv_vis_nir.user=current_user
    @uv_vis_nir.status="pending"
    @uv_vis_nir.build_equipment_table

    respond_to do |format|
      if @uv_vis_nir.save
        if @uv_vis_nir.user.role=='student'||@uv_vis_nir.user.role=='faculty'
          UvVisNirMailer.with(id:@uv_vis_nir.id, userid:current_user.id).InternalMail.deliver_later
        else
          UvVisNirMailer.with(id:@uv_vis_nir.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Uv vis nir was successfully created." }
        format.json { render :show, status: :created, location: @uv_vis_nir }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uv_vis_nir.errors, status: :unprocessable_entity }
      end
  end
end


  # PATCH/PUT /uv_vis_nirs/1 or /uv_vis_nirs/1.json
  def update
    @uv_vis_nir.status="alloted"
    @uv_vis_nir.build_equipment_table

    respond_to do |format|
      if @uv_vis_nir.update(uv_vis_nir_params)
        if @uv_vis_nir.status!= 'completed'
          UvVisNirAllotedMailer.with(id:@uv_vis_nir.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_uv_path(@uv_vis_nir), notice: "Uv vis nir was successfully updated." }
        format.json { render :show, status: :ok, location: @uv_vis_nir }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uv_vis_nir.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uv_vis_nirs/1 or /uv_vis_nirs/1.json
  def destroy
    @uv_vis_nir.destroy

    respond_to do |format|
      format.html { redirect_to uv_vis_nirs_url, notice: "Uv vis nir was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uv_vis_nir
      @uv_vis_nir = UvVisNir.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uv_vis_nir_params
<<<<<<< HEAD
      params.require(:uv_vis_nir).permit(:status, :sample, :srange, :erange,  :composition, :toxicity, :sampletype, :more,:debit, :slotdate, :slottime, :status,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email],measurement: [],references: [])
=======
      params.require(:uv_vis_nir).permit(:sample, :srange, :erange,  :composition, :toxicity, :sampletype, :more,:debit, :slotdate, :slottime, :status,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],measurement: [],references: [])
>>>>>>> 3a5c36457abb0bb6b8aaf5f51515b9b17ff1af62
    end
end
