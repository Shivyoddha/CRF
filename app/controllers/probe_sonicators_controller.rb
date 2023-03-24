class ProbeSonicatorsController < ApplicationController
  before_action :set_probe_sonicator, only: %i[ show edit update destroy ]

  # GET /probe_sonicators or /probe_sonicators.json
  def index
    @probe_sonicators = ProbeSonicator.all
  end

  # GET /probe_sonicators/1 or /probe_sonicators/1.json
  def show
  end

  # GET /probe_sonicators/new
  def new
    @probe_sonicator = ProbeSonicator.new
    @probe_sonicator.build_equipment_table
  end

  # GET /probe_sonicators/1/edit
  def edit
  end

  # POST /probe_sonicators or /probe_sonicators.json
  def create
    @probe_sonicator = ProbeSonicator.new(probe_sonicator_params)
    @probe_sonicator.user=current_user
    @probe_sonicator.status="pending"
    @probe_sonicator.build_equipment_table

    respond_to do |format|
      if @probe_sonicator.save
        if @probe_sonicator.user.role=='student'||@probe_sonicator.user.role=='faculty'
          ProbeSonicatorMailer.with(id:@probe_sonicator.id, userid:current_user.id).InternalMail.deliver_later
        else
          ProbeSonicatorMailer.with(id:@probe_sonicator.id, userid:current_user.id).ExternalMail.deliver_later
        end 
        format.html { redirect_to probe_sonicator_url(@probe_sonicator), notice: "Probe sonicator was successfully created." }
        format.json { render :show, status: :created, location: @probe_sonicator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @probe_sonicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /probe_sonicators/1 or /probe_sonicators/1.json
  def update
    @probe_sonicator.status="alloted"
    @probe_sonicator.build_equipment_table

    respond_to do |format|
      if @probe_sonicator.update(probe_sonicator_params)
        if @probe_sonicator.amount == nil
        ProbeSonicatorAllotedMailer.with(id:@probe_sonicator.id, userid:current_user.id).Mail.deliver_later
      else
        PaymentProbeSonicatorMailer.with(id:@probe_sonicator.id, userid:current_user.id).Mail.deliver_later
      end
        format.html { redirect_to slotbooker_probe_path(@probe_sonicator), notice: "Probe sonicator was successfully updated." }
        format.json { render :show, status: :ok, location: @probe_sonicator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @probe_sonicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probe_sonicators/1 or /probe_sonicators/1.json
  def destroy
    @probe_sonicator.destroy

    respond_to do |format|
      format.html { redirect_to probe_sonicators_url, notice: "Probe sonicator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probe_sonicator
      @probe_sonicator = ProbeSonicator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def probe_sonicator_params
      params.require(:probe_sonicator).permit(:sample, :size, :amplitude, :volume, :viscosity, :more, :debit, :slotdate, :slottime, :status,:user_id,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email], references: [])
    end
end
