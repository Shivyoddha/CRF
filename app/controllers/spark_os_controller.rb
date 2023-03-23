class SparkOsController < ApplicationController
  before_action :set_spark_o, only: %i[ show edit update destroy ]

  # GET /spark_os or /spark_os.json
  def index
    @spark_os = SparkO.all
  end

  # GET /spark_os/1 or /spark_os/1.json
  def show
  end

  # GET /spark_os/new
  def new
    @spark_o = SparkO.new
  end

  # GET /spark_os/1/edit
  def edit
  end

  # POST /spark_os or /spark_os.json
  def create
    @spark_o = SparkO.new(spark_o_params)
    @spark_o.user=current_user
    @spark_o.status="pending"
    respond_to do |format|
      if @spark_o.save
        if @spark_o.user.role=='student'||@spark_o.user.role=='faculty'
          SparkOMailer.with(id:@spark_o.id, userid:current_user.id).InternalMail.deliver_later
        else
          SparkOMailer.with(id:@spark_o.id, userid:current_user.id).ExternalMail.deliver_later
        end 
        format.html { redirect_to spark_o_url(@spark_o), notice: "Spark o was successfully created." }
        format.json { render :show, status: :created, location: @spark_o }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spark_o.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spark_os/1 or /spark_os/1.json
  def update
      @spark_o.status="alloted"
    respond_to do |format|
      if @spark_o.update(spark_o_params)
        if @spark_o.amount == nil
        SparkOAllotedMailer.with(id:@spark_o.id, userid:current_user.id).Mail.deliver_later
      else
        PaymentSparkOMailer.with(id:@spark_o.id, userid:current_user.id).Mail.deliver_later
      end
        format.html { redirect_to slotbooker_spark_path(@spark_o), notice: "Spark o was successfully updated." }
        format.json { render :show, status: :ok, location: @spark_o }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spark_o.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spark_os/1 or /spark_os/1.json
  def destroy
    @spark_o.destroy

    respond_to do |format|
      format.html { redirect_to spark_os_url, notice: "Spark o was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spark_o
      @spark_o = SparkO.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spark_o_params
      params.require(:spark_o).permit(:sample, :composition, :samplefe, :sampleni, :samplezn, :samplesn, :samplecu, :sampleti, :sampleal, :samplepb, :samplemg, :more, :debit, :slotdate, :slottime, :status,:user_id, references: [])
    end
end
