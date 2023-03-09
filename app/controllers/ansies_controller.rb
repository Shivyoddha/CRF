class AnsiesController < ApplicationController
  before_action :set_ansy, only: %i[ show edit update destroy ]

  # GET /ansies or /ansies.json
  def index
    @ansies = Ansy.all
  end

  # GET /ansies/1 or /ansies/1.json
  def show
  end

  # GET /ansies/new
  def new
    @ansy = Ansy.new
  end

  # GET /ansies/1/edit
  def edit
  end

  # POST /ansies or /ansies.json
  def create
    @ansy = Ansy.new(ansy_params)

    respond_to do |format|
      if @ansy.save
        format.html { redirect_to ansy_url(@ansy), notice: "Ansy was successfully created." }
        format.json { render :show, status: :created, location: @ansy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ansy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ansies/1 or /ansies/1.json
  def update
    respond_to do |format|
      if @ansy.update(ansy_params)
        format.html { redirect_to ansy_url(@ansy), notice: "Ansy was successfully updated." }
        format.json { render :show, status: :ok, location: @ansy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ansy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ansies/1 or /ansies/1.json
  def destroy
    @ansy.destroy

    respond_to do |format|
      format.html { redirect_to ansies_url, notice: "Ansy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ansy
      @ansy = Ansy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ansy_params
      params.require(:ansy).permit(:sysno, :slotdate, :purpose, :amount, :debit)
    end
end
