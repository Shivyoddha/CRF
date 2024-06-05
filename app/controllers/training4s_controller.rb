class Training4sController < ApplicationController
  before_action :set_training4, only: %i[ show edit update destroy ]

  # GET /training4s or /training4s.json
  def index
    @training4s = Training4.all
  end

  # GET /training4s/1 or /training4s/1.json
  def show
  end

  # GET /training4s/new
  def new
    @training4 = Training4.new
    @training = TrainingList.find(params[:training_id])
  end

  # GET /training4s/1/edit
  def edit
  end

  # POST /training4s or /training4s.json
  def create
    @training4 = Training4.new(training4_params)
    @training4.user_id = current_user.id
    @training4.save
    respond_to do |format|
      if @training4.save
        TrainingFormMailer.with(training_id: @training4.training_list_id, userid:current_user.id, present_id: @training4.id).form_filled.deliver_later
        format.html { redirect_to training_lists_path(user_id: current_user.id), notice: "Training4 was successfully created." }
        format.json { render :show, status: :created, location: @training4 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training4.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training4s/1 or /training4s/1.json
  def update
    @training4.status = "alloted"
    respond_to do |format|
      if @training4.update(training4_params)
        if(@training4.status == "pending")
          format.html { redirect_to training_slot_alloted_path, notice: "Training4 was successfully updated." }
          format.json { render :show, status: :ok, location: @training4 }
        else
          format.html { redirect_to training_slot_alloted_path, notice: "Training4 was successfully updated." }
          format.json { render :show, status: :ok, location: @training4 }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training4.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training4s/1 or /training4s/1.json
  def destroy
    @training4.destroy

    respond_to do |format|
      format.html { redirect_to training4s_url, notice: "Training4 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training4
      @training4 = Training4.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training4_params
      params.require(:training4).permit(:sample, :debit, :more, :user_id, :slotdate, :slottime, :status, :training_list_id)
    end
end
