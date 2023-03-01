class MilliQsController < ApplicationController
  before_action :set_milli_q, only: %i[ show edit update destroy ]

  # GET /milli_qs or /milli_qs.json
  def index
    @milli_qs = MilliQ.all
  end

  # GET /milli_qs/1 or /milli_qs/1.json
  def show
  end

  # GET /milli_qs/new
  def new
    @milli_q = MilliQ.new
  end

  # GET /milli_qs/1/edit
  def edit
  end

  # POST /milli_qs or /milli_qs.json
  def create
    @milli_q = MilliQ.new(milli_q_params)
    @milli_q.user=current_user
    @milli_q.status="pending"
    respond_to do |format|
      if @milli_q.save
        format.html { redirect_to milli_q_url(@milli_q), notice: "Milli q was successfully created." }
        format.json { render :show, status: :created, location: @milli_q }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milli_q.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milli_qs/1 or /milli_qs/1.json
  def update
    respond_to do |format|
      if @milli_q.update(milli_q_params)
        format.html { redirect_to milli_q_url(@milli_q), notice: "Milli q was successfully updated." }
        format.json { render :show, status: :ok, location: @milli_q }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @milli_q.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milli_qs/1 or /milli_qs/1.json
  def destroy
    @milli_q.destroy

    respond_to do |format|
      format.html { redirect_to milli_qs_url, notice: "Milli q was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milli_q
      @milli_q = MilliQ.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def milli_q_params
      params.require(:milli_q).permit(:typewater, :volumeone, :volumetwo, :more, :debit, :slotdate, :slottime, :status,:user_id, references: [])
    end
end
