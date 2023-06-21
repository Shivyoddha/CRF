class IonChromotographiesController < ApplicationController
  before_action :set_ion_chromotography, only: %i[ show edit update destroy ]

  # GET /ion_chromotographies or /ion_chromotographies.json
  def index
    @ion_chromotographies = IonChromotography.all
  end

  # GET /ion_chromotographies/1 or /ion_chromotographies/1.json
  def show
  end

  # GET /ion_chromotographies/new
  def new
    @user=User.find(params[:id])
    @ion_chromotography = IonChromotography.new
    @ion_chromotography.build_equipment_table

  end

  # GET /ion_chromotographies/1/edit
  def edit
  end

  # POST /ion_chromotographies or /ion_chromotographies.json
  def create
    @ion_chromotography = IonChromotography.new(ion_chromotography_params)
    @ion_chromotography.user=current_user
    @ion_chromotography.status="pending"
    @ion_chromotography.build_equipment_table
    @ion_chromotography.equipment_table.dummy = "alloted"
    @ion_chromotography.equipment_table.username = @ion_chromotography.user.name
    @ion_chromotography.equipment_table.equipname = "ion_chromotography"
    @ion_chromotography.equipment_table.app_no ="CRF/IC/#{@ion_chromotography.id}"
    @ion_chromotography.equipment_table.debit_head = @ion_chromotography.debit
    @ion_chromotography.equipment_table.role = @ion_chromotography.user.role
    @ion_chromotography.equipment_table.email = @ion_chromotography.user.email
    @ion_chromotography.equipment_table.dept = @ion_chromotography.user.department
    @ion_chromotography.equipment_table.profesion = @ion_chromotography.user.profession
    @ion_chromotography.equipment_table.orgname = @ion_chromotography.user.orgname

    respond_to do |format|
      if @ion_chromotography.save
        if @ion_chromotography.user.role=='student'||@ion_chromotography.user.role=='faculty'
          IonChromotographyMailer.with(id:@ion_chromotography.id, userid:current_user.id).InternalMail.deliver_later
        else
          IonChromotographyMailer.with(id:@ion_chromotography.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Ion chromotography was successfully created." }
        format.json { render :show, status: :created, location: @ion_chromotography }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ion_chromotography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ion_chromotographies/1 or /ion_chromotographies/1.json
  def update
    @ion_chromotography.status="alloted"
    @ion_chromotography.build_equipment_table

    respond_to do |format|
      if @ion_chromotography.update(ion_chromotography_params)
        if @ion_chromotography.status!= 'completed'
          IonChromotographyAllotedMailer.with(id:@ion_chromotography.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_ionc_path(@ion_chromotography), notice: "Ion chromotography was successfully updated." }
        format.json { render :show, status: :ok, location: @ion_chromotography }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ion_chromotography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ion_chromotographies/1 or /ion_chromotographies/1.json
  def destroy
    @ion_chromotography.destroy

    respond_to do |format|
      format.html { redirect_to ion_chromotographies_url, notice: "Ion chromotography was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ion_chromotography
      @ion_chromotography = IonChromotography.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ion_chromotography_params
      params.require(:ion_chromotography).permit(:sample, :nature, :solvent, :volume, :concentration, :eluent, :analysis, :elements, :column, :flow_rate, :temperature, :detector, :toxicity, :hazards, :disposal, :more,:status,:slotdate,:slottime,:debit,:hazard_yes,:disposal_yes,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],hazard_method: [], references: [])
    end
end
