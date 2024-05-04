class Training1sController < ApplicationController
  before_action :set_training1, only: %i[ show edit update destroy ]

  # GET /training1s or /training1s.json
  def index
    @training1s = Training1.all
  end

  # GET /training1s/1 or /training1s/1.json
  def show
  end

  # GET /training1s/new
  def new
    @training1 = Training1.new
    @training = TrainingList.find(params[:training_id])
  end

  # GET /training1s/1/edit
  def edit
  end

  # POST /training1s or /training1s.json
  def create
    @training1 = Training1.new(training1_params)

    @training1.user_id = current_user.id
    @training1.save
    respond_to do |format|
      if @training1.save
        format.html { redirect_to training_lists_path(user_id: current_user.id), notice: "Training1 was successfully created." }
        format.json { render :show, status: :created, location: @training1 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training1s/1 or /training1s/1.json
  def update
    @training1.status = "alloted"
    respond_to do |format|
      if @training1.update(training1_params)
        if(@training1.status == "pending")
        format.html { redirect_to training_slot_alloted_path, notice: "Training1 was successfully updated." }
        format.json { render :show, status: :ok, location: @training1 }
        else
        format.html { redirect_to training_slot_alloted_path, notice: "Training1 was successfully updated." }
        format.json { render :show, status: :ok, location: @training1 }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training1s/1 or /training1s/1.json
  def destroy
    @training1.destroy

    respond_to do |format|
      format.html { redirect_to training1s_url, notice: "Training1 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training1
      @training1 = Training1.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training1_params
      params.require(:training1).permit(:sample, :debit, :more, :user_id, :slotdate, :slottime, :status)
    end
end
