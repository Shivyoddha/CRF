class EquiplistsController < ApplicationController
  before_action :set_equiplist, only: %i[ show edit update destroy ]
  def import
    return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
    return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    CsvImportService.new.call(params[:file])

    redirect_to request.referer, notice: 'Import started...'
  end
  # GET /equiplists or /equiplists.json
  def index
    @equiplists = Equiplist.all
  end

  # GET /equiplists/1 or /equiplists/1.json
  def show
  end

  # GET /equiplists/new
  def new
    @equiplist = Equiplist.new
  end

  # GET /equiplists/1/edit
  def edit
  end

  # POST /equiplists or /equiplists.json
  def create
    @equiplist = Equiplist.new(equiplist_params)

    respond_to do |format|
      if @equiplist.save
        format.html { redirect_to equiplist_url(@equiplist), notice: "Equiplist was successfully created." }
        format.json { render :show, status: :created, location: @equiplist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equiplist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equiplists/1 or /equiplists/1.json
  def update
    respond_to do |format|
      if @equiplist.update(equiplist_params)
        format.html { redirect_to mainportal_adminModelEquip_path, notice: "Equiplist was successfully updated." }
        format.json { render :show, status: :ok, location: @equiplist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equiplist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equiplists/1 or /equiplists/1.json
  def destroy
    @equiplist.destroy

    respond_to do |format|
      format.html { redirect_to equiplists_url, notice: "Equiplist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equiplist
      @equiplist = Equiplist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equiplist_params
      params.require(:equiplist).permit(:name, :status, :calibrate)
    end
end
