class LasersController < ApplicationController
  before_action :set_laser, only: %i[ show edit update destroy ]

  # GET /lasers or /lasers.json
  def index
    @lasers = Laser.all
  end

  # GET /lasers/1 or /lasers/1.json
  def show
  end

  # GET /lasers/new
  def new
    @laser = Laser.new
    @laser.build_equipment_table

  end

  # GET /lasers/1/edit
  def edit
  end

  # POST /lasers or /lasers.json
  def create
    @laser = Laser.new(laser_params)
    @laser.user=current_user
    @laser.status="pending"
    @laser.build_equipment_table

    respond_to do |format|
      if @laser.save
        if @laser.user.role=='student'||@laser.user.role=='faculty'
          LaserMailer.with(id:@laser.id, userid:current_user.id).InternalMail.deliver_later
        else
          LaserMailer.with(id:@laser.id, userid:current_user.id).ExternalMail.deliver_later
        end
<<<<<<< HEAD
<<<<<<< HEAD
        format.html { redirect_to home_index_path, notice: "Laser was successfully created." }
=======
=======
>>>>>>> c95eb03bcfaf4f67b061724f5933bb4c21e41a9b
        format.html { redirect_to laser_url(@laser), notice: "Laser was successfully created." }
>>>>>>> c95eb03bcfaf4f67b061724f5933bb4c21e41a9b
        format.json { render :show, status: :created, location: @laser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lasers/1 or /lasers/1.json
  def update
    @laser.status="alloted"
    @laser.build_equipment_table

    respond_to do |format|
      if @laser.update(laser_params)
        format.html { redirect_to slotbooker_laser_path(@laser), notice: "Laser was successfully updated." }
        format.json { render :show, status: :ok, location: @laser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lasers/1 or /lasers/1.json
  def destroy
    @laser.destroy

    respond_to do |format|
      format.html { redirect_to lasers_url, notice: "Laser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laser
      @laser = Laser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laser_params
      params.require(:laser).permit(:sample, :composition, :stype, :temp_points, :toxicity, :compatibility, :more, :debit, :slotdate, :slottime, :status,:user_id,  equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email] , references: [])
    end
end
