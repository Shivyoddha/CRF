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
    @milli_q.build_equipment_table

  end

  # GET /milli_qs/1/edit
  def edit
  end

  # POST /milli_qs or /milli_qs.json
  def create
    @milli_q = MilliQ.new(milli_q_params)
    @milli_q.user=current_user
    @milli_q.status="pending"
    @milli_q.build_equipment_table
    @milli_q.equipment_table.dummy = "alloted"
    @milli_q.equipment_table.username = @milli_q.user.name
    @milli_q.equipment_table.equipname = "Milli-Q water"
    @milli_q.equipment_table.app_no = @milli_q.id
    @milli_q.equipment_table.debit_head = @milli_q.debit
    @milli_q.equipment_table.role = @milli_q.user.role
    @milli_q.equipment_table.email = @milli_q.user.email
    @milli_q.equipment_table.dept = @milli_q.user.department
    @milli_q.equipment_table.profesion = @milli_q.user.profession
    @milli_q.equipment_table.orgname = @milli_q.user.orgname

     # @milli_q.amount1=0
     # @milli_q.amount2=0
    # 'Student','Faculty','R & D Professional','Industry Professional','Entrepreneur'
    if @milli_q.user.role=='student'||@milli_q.user.role=='faculty'
         if @milli_q.volumeone.present?
         @milli_q.amount1 = (300.0)*@milli_q.volumeone
       end
       if @milli_q.volumetwo.present?
        @milli_q.amount2= (200.0)*@milli_q.volumetwo
      end
    end
    if @milli_q.user.profession=='R & D Professional'||@milli_q.user.profession=='Student'||@milli_q.user.profession=='Faculty'
        if @milli_q.volumeone.present?
         @milli_q.amount1 = (450.0)*@milli_q.volumeone
       end
         if @milli_q.volumetwo.present?
         @milli_q.amount2= (300.0)*@milli_q.volumetwo
       end
    end
    if @milli_q.user.profession=='Industry Professional'|| @milli_q.user.profession=='Entrepreneur'
         if @milli_q.volumeone.present?
         @milli_q.amount1 = ( 1200.0)*@milli_q.volumeone
       end
          if @milli_q.volumetwo.present?
         @milli_q.amount2= (800)*@milli_q.volumetwo
       end
    end
        @milli_q.amounttotal=0

         if @milli_q.volumeone.nil?
           @milli_q.amount1=0
         end
         if @milli_q.volumetwo.nil?
           @milli_q.amount2=0
         end
         if @milli_q.amounttotal.nil?
           @milli_q.amounttotal=0
        end
             @milli_q.amounttotal = @milli_q.amount1 + @milli_q.amount2


    respond_to do |format|
      if @milli_q.save
        if @milli_q.user.role=='student'||@milli_q.user.role=='faculty'
          MilliQMailer.with(id:@milli_q.id, userid:current_user.id).InternalMail.deliver_later
        else
          MilliQMailer.with(id:@milli_q.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Milli q was successfully created." }
        format.json { render :show, status: :created, location: @milli_q }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milli_q.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milli_qs/1 or /milli_qs/1.json
  def update
    @milli_q.build_equipment_table
      @milli_q.status="alloted"
    respond_to do |format|
      if @milli_q.update(milli_q_params)
        if @milli_q.amount == nil
        MilliQAllotedMailer.with(id:@milli_q.id, userid:current_user.id).Mail.deliver_later
      else
        PaymentMilliQMailer.with(id:@milli_q.id, userid:current_user.id).Mail.deliver_later
      end
        format.html { redirect_to slotbooker_milli_path(@milli_q), notice: "Milli q was successfully updated." }
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
      params.require(:milli_q).permit(:typewater, :volumeone, :volumetwo, :more, :debit, :slotdate, :slottime, :status,:amount1,:amount2,:amounttotal,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] , references: [])
    end
end
