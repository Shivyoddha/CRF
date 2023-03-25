class UltraCentrifugesController < ApplicationController
  before_action :set_ultra_centrifuge, only: %i[ show edit update destroy ]

  # GET /ultra_centrifuges or /ultra_centrifuges.json
  def index
    @ultra_centrifuges = UltraCentrifuge.all
  end

  # GET /ultra_centrifuges/1 or /ultra_centrifuges/1.json
  def show
  end

  # GET /ultra_centrifuges/new
  def new
    @ultra_centrifuge = UltraCentrifuge.new
    @ultra_centrifuge.build_equipment_table

  end

  # GET /ultra_centrifuges/1/edit
  def edit
  end

  # POST /ultra_centrifuges or /ultra_centrifuges.json
  def create
    @ultra_centrifuge = UltraCentrifuge.new(ultra_centrifuge_params)
    @ultra_centrifuge.user=current_user
    @ultra_centrifuge.status="pending"
    @ultra_centrifuge.build_equipment_table

    respond_to do |format|
      if @ultra_centrifuge.save
        if @ultra_centrifuge.user.role=='student'||@ultra_centrifuge.user.role=='faculty'
          UltraCentrifugeMailer.with(id:@ultra_centrifuge.id, userid:current_user.id).InternalMail.deliver_later
        else
          UltraCentrifugeMailer.with(id:@ultra_centrifuge.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to ultra_centrifuge_url(@ultra_centrifuge), notice: "Ultra centrifuge was successfully created." }
        format.json { render :show, status: :created, location: @ultra_centrifuge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ultra_centrifuge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ultra_centrifuges/1 or /ultra_centrifuges/1.json
  def update
      @ultra_centrifuge.status="alloted"
      @ultra_centrifuge.build_equipment_table

    respond_to do |format|
      if @ultra_centrifuge.update(ultra_centrifuge_params)
        UltraCentrifugeAllotedMailer.with(id:@ultra_centrifuge.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_centrifuge_path(@ultra_centrifuge), notice: "Ultra centrifuge was successfully updated." }
        format.json { render :show, status: :ok, location: @ultra_centrifuge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ultra_centrifuge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ultra_centrifuges/1 or /ultra_centrifuges/1.json
  def destroy
    @ultra_centrifuge.destroy

    respond_to do |format|
      format.html { redirect_to ultra_centrifuges_url, notice: "Ultra centrifuge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ultra_centrifuge
      @ultra_centrifuge = UltraCentrifuge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ultra_centrifuge_params
      params.require(:ultra_centrifuge).permit(:sample, :volume, :speed, :temperature, :toxicity, :compatibility, :carcinogenic, :more, :debit, :slotdate, :slottime, :status,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email],references: [])
    end
end
