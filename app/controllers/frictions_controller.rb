class FrictionsController < ApplicationController
  before_action :set_friction, only: %i[ show edit update destroy ]

  # GET /frictions or /frictions.json
  def index
    @frictions = Friction.all
  end

  # GET /frictions/1 or /frictions/1.json
  def show
  end

  # GET /frictions/new
  def new
    @friction = Friction.new
    @user=User.find(params[:id])
  end

  # GET /frictions/1/edit
  def edit
  end

  # POST /frictions or /frictions.json
  def create
    @friction = Friction.new(friction_params)
    @friction.user=current_user
    @friction.status="pending"


    respond_to do |format|
      if @friction.save
        FrictionMailer.with(id:@friction.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to friction_url(@friction), notice: "Friction was successfully created." }
        format.json { render :show, status: :created, location: @friction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frictions/1 or /frictions/1.json
  def update
      @friction.status="alloted"
    respond_to do |format|
      if @friction.update(friction_params)
        @friction.status="alloted"
        format.html { redirect_to slotbooker_fric_path(@friction), notice: "Friction was successfully updated." }
        format.json { render :show, status: :ok, location: @friction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frictions/1 or /frictions/1.json
  def destroy
    @friction.destroy

    respond_to do |format|
      format.html { redirect_to frictions_url, notice: "Friction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friction
      @friction = Friction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friction_params
      params.require(:friction).permit(:sample, :material, :pstype, :tool, :toolnom, :rspeed, :wspeed, :otforce, :wtemp,:temp, :measurement, :depth, :ptforce, :more, :status, :slotdate, :slottime, :debit,:user_id, references: [])
    end
end
