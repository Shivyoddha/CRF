class ZetaPotentialSizesController < ApplicationController
  before_action :set_zeta_potential_size, only: %i[ show edit update destroy ]

  # GET /zeta_potential_sizes or /zeta_potential_sizes.json
  def index
    @zeta_potential_sizes = ZetaPotentialSize.all
  end

  # GET /zeta_potential_sizes/1 or /zeta_potential_sizes/1.json
  def show
  end

  # GET /zeta_potential_sizes/new
  def new
    @zeta_potential_size = ZetaPotentialSize.new
    @zeta_potential_size.build_equipment_table

  end

  # GET /zeta_potential_sizes/1/edit
  def edit
  end

  # POST /zeta_potential_sizes or /zeta_potential_sizes.json
  def create
    @zeta_potential_size = ZetaPotentialSize.new(zeta_potential_size_params)
    @zeta_potential_size.user=current_user
    @zeta_potential_size.status="pending"
    @zeta_potential_size.build_equipment_table
    @zeta_potential_size.equipment_table.dummy = "alloted"
    @zeta_potential_size.equipment_table.username = @zeta_potential_size.user.name
    @zeta_potential_size.equipment_table.equipname = "Zeta Potential/Particle Sizer"
    @zeta_potential_size.equipment_table.debit_head = @zeta_potential_size.debit
    @zeta_potential_size.equipment_table.role = @zeta_potential_size.user.role
    @zeta_potential_size.equipment_table.email = @zeta_potential_size.user.email
    @zeta_potential_size.equipment_table.dept = @zeta_potential_size.user.department
    @zeta_potential_size.equipment_table.profesion = @zeta_potential_size.user.profession
    @zeta_potential_size.equipment_table.orgname = @zeta_potential_size.user.orgname

    respond_to do |format|
      if @zeta_potential_size.save
        if @zeta_potential_size.user.role=='student'||@zeta_potential_size.user.role=='faculty'
          ZetaPotentialSizeMailer.with(id:@zeta_potential_size.id, userid:current_user.id).InternalMail.deliver_later
        else
          ZetaPotentialSizeMailer.with(id:@zeta_potential_size.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Zeta potential size was successfully created." }
        format.json { render :show, status: :created, location: @zeta_potential_size }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @zeta_potential_size.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /zeta_potential_sizes/1 or /zeta_potential_sizes/1.json
  def update
    @zeta_potential_size.status="alloted"
    @zeta_potential_size.build_equipment_table

    respond_to do |format|
      if @zeta_potential_size.update(zeta_potential_size_params)
        if @zeta_potential_size.status!= 'completed'
          ZetaPotentialSizeAllotedMailer.with(id:@zeta_potential_size.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_zeta_path(@zeta_potential_size), notice: "Zeta potential size was successfully updated." }
        format.json { render :show, status: :ok, location: @zeta_potential_size }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @zeta_potential_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zeta_potential_sizes/1 or /zeta_potential_sizes/1.json
  def destroy
    @zeta_potential_size.destroy

    respond_to do |format|
      format.html { redirect_to zeta_potential_sizes_url, notice: "Zeta potential size was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zeta_potential_size
      @zeta_potential_size = ZetaPotentialSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def zeta_potential_size_params
      params.require(:zeta_potential_size).permit(:sample, :stype, :toxicity, :element, :solvent, :refractive_index, :viscositypoise,:viscositytemp,:angle, :analysis_type, :analysis_temperature, :more,:soluteknown,:solutename,:refindex,:abscoefficent,:debit,:slotdate,:slottime,:status,:user_id ,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname],references: [])
    end
end
