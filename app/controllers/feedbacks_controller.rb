class FeedbacksController < ApplicationController
   before_action :set_feedback, only: %i[ show edit update destroy ]

   def import
     return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
     return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

     CsvImportService.new.call_feedback(params[:file])

     redirect_to request.referer, notice: 'Import started...'
   end

  # GET /feedbacks or /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
  end
  def authenticate_admin!
    unless current_user&.admin_role?
      redirect_to home_index_path, alert: "You are not authorized to access this page."
    end
  end

  # GET /feedbacks/new
  def new
    @user=User.find(params[:id])
    @feedback = Feedback.new
    @current_date = Date.today
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to new_user_session_path, notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1 or /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to feedback_url(@feedback), notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
       @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
     def feedback_params
       params.require(:feedback).permit(:username, :email, :feedback, :date, :user_id)
     end
end
