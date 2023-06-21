class GaitsController < ApplicationController
  before_action :set_gait, only: %i[ show edit update destroy ]

  # GET /gaits or /gaits.json
  def index
    @gaits = Gait.all
  end

  # GET /gaits/1 or /gaits/1.json
  def show
  end

  # GET /gaits/new
  def new
    @gait = Gait.new
    @user=User.find(params[:id])
    @gait.build_equipment_table
    @gait.equipment_table.dummy = "alloted"
    @gait.equipment_table.username = @gait.user.name
    @gait.equipment_table.equipname = "GAIT Analysis"
    @gait.equipment_table.debit_head = @gait.debit
    @gait.equipment_table.role = @gait.user.role
    @gait.equipment_table.email = @gait.user.email
    @gait.equipment_table.dept = @gait.user.department
    @gait.equipment_table.profesion = @gait.user.profession
    @gait.equipment_table.orgname = @gait.user.orgname

  end

  # GET /gaits/1/edit
  def edit
  end

  # POST /gaits or /gaits.json
  def create
   @gait = Gait.new(gait_params)
    @gait.user=current_user
    @gait.status="pending"
    @gait.build_equipment_table


    respond_to do |format|
      if @gait.save
        if @gait.user.role=='student'||@gait.user.role=='faculty'
          GaitMailer.with(id:@gait.id, userid:current_user.id).InternalMail.deliver_later
        else
          GaitMailer.with(id:@gait.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Gait was successfully created." }
        format.json { render :show, status: :created, location: @gait }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gaits/1 or /gaits/1.json
  def update
      @gait.status="alloted"
      @gait.build_equipment_table
    respond_to do |format|
      if @gait.update(gait_params)
        if @gait.status!= 'completed'
          GaitAllotedMailer.with(id:@gait.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_gait_path(@gait), notice: "Gait was successfully updated." }
        format.json { render :show, status: :ok, location: @gait }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gaits/1 or /gaits/1.json
  def destroy
    @gait.destroy

    respond_to do |format|
      format.html { redirect_to gaits_url, notice: "Gait was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gait
      @gait = Gait.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gait_params
      params.require(:gait).permit(:subject, :measurement, :trials, :force_plate, :clinical_trial, :physician, :more, :status, :slotdate, :slottime, :debit,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] ,ethicals: [], prescrptions: [],clinicals: [],output_format: [], references: [])
    end
end
