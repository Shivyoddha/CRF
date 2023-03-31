class MultiImpactTestersController < ApplicationController
  before_action :set_multi_impact_tester, only: %i[ show edit update destroy ]

  # GET /multi_impact_testers or /multi_impact_testers.json
  def index
    @multi_impact_testers = MultiImpactTester.all
  end

  # GET /multi_impact_testers/1 or /multi_impact_testers/1.json
  def show
  end

  # GET /multi_impact_testers/new
  def new
    @user=User.find(params[:id])
    @multi_impact_tester = MultiImpactTester.new
    @multi_impact_tester.build_equipment_table

  end

  # GET /multi_impact_testers/1/edit
  def edit
  end

  # POST /multi_impact_testers or /multi_impact_testers.json
  def create
    @multi_impact_tester = MultiImpactTester.new(multi_impact_tester_params)
    @multi_impact_tester.user=current_user
    @multi_impact_tester.status="pending"
    @multi_impact_tester.build_equipment_table
    respond_to do |format|
      if @multi_impact_tester.save
        if @multi_impact_tester.user.role=='student'||@multi_impact_tester.user.role=='faculty'
          MultiImpactTesterMailer.with(id:@multi_impact_tester.id, userid:current_user.id).InternalMail.deliver_later
        else
          MultiImpactTesterMailer.with(id:@multi_impact_tester.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Multi impact tester was successfully created." }
        format.json { render :show, status: :created, location: @multi_impact_tester }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @multi_impact_tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multi_impact_testers/1 or /multi_impact_testers/1.json
  def update
    @multi_impact_tester.status="alloted"
    @multi_impact_tester.build_equipment_table

    respond_to do |format|
      if @multi_impact_tester.update(multi_impact_tester_params)
        if @multi_impact_tester.status!= 'completed'
          MultiImpactTesterAllotedMailer.with(id:@multi_impact_tester.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_multi_path(@multi_impact_tester), notice: "Multi impact tester was successfully updated." }
        format.json { render :show, status: :ok, location: @multi_impact_tester }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @multi_impact_tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multi_impact_testers/1 or /multi_impact_testers/1.json
  def destroy
    @multi_impact_tester.destroy

    respond_to do |format|
      format.html { redirect_to multi_impact_testers_url, notice: "Multi impact tester was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_impact_tester
      @multi_impact_tester = MultiImpactTester.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multi_impact_tester_params
      params.require(:multi_impact_tester).permit(:sample, :stype, :size, :measuerment, :drop_range, :drop_velocity, :drop_temp, :drop_shape, :shpb_lenght, :shpb_temp, :bullet_velocity, :bullet_shape, :bird_velocity, :bird_shape, :more, :status, :slotdate, :slottime, :debit, :user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] , references: [])
    end
end
