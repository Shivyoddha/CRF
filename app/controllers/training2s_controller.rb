class Training2sController < ApplicationController
  before_action :set_training2, only: %i[ show edit update destroy ]

  # GET /training2s or /training2s.json
  def index
    @training2s = Training2.all
  end

  # GET /training2s/1 or /training2s/1.json
  def show
  end

  # GET /training2s/new
  def new
    @training2 = Training2.new
    @training = TrainingList.find(params[:training_id])
  end

  # GET /training2s/1/edit
  def edit
  end

  # POST /training2s or /training2s.json
  def create
    @training2 = Training2.new(training2_params)
    @training2.user_id = current_user.id
    @training2.save
    respond_to do |format|
      if @training2.save
        TrainingFormMailer.with(training_id: @training2.training_list_id, userid:current_user.id, present_id: @training2.id).form_filled.deliver_later
        format.html { redirect_to training_lists_path(user_id: current_user.id), notice: "Training2 was successfully created." }
        format.json { render :show, status: :created, location: @training2 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training2s/1 or /training2s/1.json
  def update
    @training2.status = "alloted"
    respond_to do |format|
      if @training2.update(training2_params)
        if(@training2.status == "pending")
        format.html { redirect_to training_slot_alloted_path, notice: "Training2 was successfully updated." }
        format.json { render :show, status: :ok, location: @training2 }
        else
        format.html { redirect_to training_slot_alloted_path, notice: "Training2 was successfully updated." }
        format.json { render :show, status: :ok, location: @training2 }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training2s/1 or /training2s/1.json
  def destroy
    @training2.destroy

    respond_to do |format|
      format.html { redirect_to training2s_url, notice: "Training2 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training2
      @training2 = Training2.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training2_params
      params.require(:training2).permit(:sample, :debit, :more, :user_id, :slotdate, :slottime, :status, :training_list_id)
    end
end
