class AdvanceMolecularRheometersController < ApplicationController
  before_action :set_advance_molecular_rheometer, only: %i[ show edit update destroy ]

  # GET /advance_molecular_rheometers or /advance_molecular_rheometers.json
  def index
    @advance_molecular_rheometers = AdvanceMolecularRheometer.all
  end

  # GET /advance_molecular_rheometers/1 or /advance_molecular_rheometers/1.json
  def show
  end

  # GET /advance_molecular_rheometers/new
  def new
    @user=User.find(params[:id])
    @advance_molecular_rheometer = AdvanceMolecularRheometer.new
    @advance_molecular_rheometer.build_equipment_table

  end

  # GET /advance_molecular_rheometers/1/edit
  def edit
  end

  # POST /advance_molecular_rheometers or /advance_molecular_rheometers.json
  def create
    @advance_molecular_rheometer = AdvanceMolecularRheometer.new(advance_molecular_rheometer_params)
    @advance_molecular_rheometer.user=current_user
    @advance_molecular_rheometer.status="pending"
    @advance_molecular_rheometer.build_equipment_table

    respond_to do |format|

     if @advance_molecular_rheometer.save
       if @advance_molecular_rheometer.user.role=='student'||@advance_molecular_rheometer.user.role=='faculty'
         AdvanceMolecularRheometerMailer.with(id:@advance_molecular_rheometer.id, userid:current_user.id).InternalMail.deliver_later
       else
         AdvanceMolecularRheometerMailer.with(id:@advance_molecular_rheometer.id, userid:current_user.id).ExternalMail.deliver_later
       end
       format.html { redirect_to home_index_path, notice: "Advance molecular rheometer was successfully created." }
       format.json { render :show, status: :created, location: @advance_molecular_rheometer }
     else
       format.html { render :new, status: :unprocessable_entity }
       format.json { render json: @advance_molecular_rheometer.errors, status: :unprocessable_entity }
     end
   end
 end

  # PATCH/PUT /advance_molecular_rheometers/1 or /advance_molecular_rheometers/1.json
  def update
    @advance_molecular_rheometer.status="alloted"
    @advance_molecular_rheometer.build_equipment_table
    respond_to do |format|
      if @advance_molecular_rheometer.update(advance_molecular_rheometer_params)
         AdvanceMolecularRheometerAllotedMailer.with(id:@advance_molecular_rheometer.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_amr_path(@advance_molecular_rheometer), notice: "Advance molecular rheometer was successfully updated." }
        format.json { render :show, status: :ok, location: @advance_molecular_rheometer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advance_molecular_rheometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advance_molecular_rheometers/1 or /advance_molecular_rheometers/1.json
  def destroy
    @advance_molecular_rheometer.destroy

    respond_to do |format|
      format.html { redirect_to advance_molecular_rheometers_url, notice: "Advance molecular rheometer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance_molecular_rheometer
      @advance_molecular_rheometer = AdvanceMolecularRheometer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advance_molecular_rheometer_params
      params.require(:advance_molecular_rheometer).permit(:sample, :stype, :size, :nature, :temperature, :current, :shear_type, :shear_rate, :sweeps, :analysis, :toxicity, :more,:status,:debit,:slotdate, :slottime,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email], references: [])
    end
end
