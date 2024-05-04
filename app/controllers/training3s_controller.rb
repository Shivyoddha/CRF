class Training3sController < ApplicationController
  before_action :set_training3, only: %i[ show edit update destroy ]

  # GET /training3s or /training3s.json
  def index
    @training3s = Training3.all
  end

  # GET /training3s/1 or /training3s/1.json
  def show
  end

  # GET /training3s/new
  def new
    @training3 = Training3.new
    @training = TrainingList.find(params[:training_id])
  end

  # GET /training3s/1/edit
  def edit
  end

  # POST /training3s or /training3s.json
  def create
    @training3 = Training3.new(training3_params)
    @training3.user_id = current_user.id
    @training3.save
    respond_to do |format|
      if @training3.save
        format.html { redirect_to training_lists_path(user_id: current_user.id), notice: "Training3 was successfully created." }
        format.json { render :show, status: :created, location: @training3 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training3s/1 or /training3s/1.json
  def update
    @training3.status = "alloted"
    respond_to do |format|
      if @training3.update(training1_params)
        if(@training3.status == "pending")
        format.html { redirect_to training_slot_alloted_path, notice: "Training3 was successfully updated." }
        format.json { render :show, status: :ok, location: @training3 }
        else
        format.html { redirect_to training_slot_alloted_path, notice: "Training3 was successfully updated." }
        format.json { render :show, status: :ok, location: @training3 }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training3s/1 or /training3s/1.json
  def destroy
    @training3.destroy

    respond_to do |format|
      format.html { redirect_to training3s_url, notice: "Training3 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training3
      @training3 = Training3.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training3_params
      params.require(:training4).permit(:sample, :debit, :more, :user_id, :slotdate, :slottime, :status)
    end
end
