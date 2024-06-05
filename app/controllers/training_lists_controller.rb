class TrainingListsController < ApplicationController
  before_action :set_training_list, only: %i[ show edit update destroy ]

  # GET /training_lists or /training_lists.json
  def index
    @user = User.find(params[:user_id])
    @training_lists = TrainingList.all
  end

  # GET /training_lists/1 or /training_lists/1.json
  def show
  end

  # GET /training_lists/new
  def new
    @training_list = TrainingList.new
  end

  # GET /training_lists/1/edit
  def edit
  end

  # POST /training_lists or /training_lists.json
  def create
    @training_list = TrainingList.new(training_list_params)

    respond_to do |format|
      if @training_list.save
        format.html { redirect_to training_list_url(@training_list), notice: "Training list was successfully created." }
        format.json { render :show, status: :created, location: @training_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_lists/1 or /training_lists/1.json
  def update
    respond_to do |format|
      if @training_list.update(training_list_params)
        format.html { redirect_to training_list_url(@training_list), notice: "Training list was successfully updated." }
        format.json { render :show, status: :ok, location: @training_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_lists/1 or /training_lists/1.json
  def destroy
    @training_list.destroy

    respond_to do |format|
      format.html { redirect_to training_lists_url, notice: "Training list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_list
      @training_list = TrainingList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_list_params
      params.require(:training_list).permit(:name, images: [])
    end
end
