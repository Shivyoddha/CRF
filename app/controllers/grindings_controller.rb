class GrindingsController < ApplicationController
  before_action :set_grinding, only: %i[ show edit update destroy ]

  # GET /grindings or /grindings.json
  def index
    @grindings = Grinding.all
  end

  # GET /grindings/1 or /grindings/1.json
  def show
  end

  # GET /grindings/new
  def new
    @grinding = Grinding.new
    @user=User.find(params[:id])
  end

  # GET /grindings/1/edit
  def edit
  end

  # POST /grindings or /grindings.json
  def create
    @grinding = Grinding.new(grinding_params)
    @grinding.user=current_user
    @grinding.status="pending"

    respond_to do |format|
      if @grinding.save
        GrindingMailer.with(id:@grinding.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to grinding_url(@grinding), notice: "Grinding was successfully created." }
        format.json { render :show, status: :created, location: @grinding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grinding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grindings/1 or /grindings/1.json
  def update
      @grinding.status="alloted"
    respond_to do |format|
      if @grinding.update(grinding_params)
          @grinding.status="alloted"
        format.html { redirect_to slotbooker_grind_path(@grinding), notice: "Grinding was successfully updated." }
        format.json { render :show, status: :ok, location: @grinding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grinding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grindings/1 or /grindings/1.json
  def destroy
    @grinding.destroy

    respond_to do |format|
      format.html { redirect_to grindings_url, notice: "Grinding was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grinding
      @grinding = Grinding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grinding_params
      params.require(:grinding).permit(:sample, :diameter, :mould, :grit, :diamond, :suspension, :lapping, :more, :status, :slotdate, :slottime, :debit,:user_id,references: [])
    end
end
