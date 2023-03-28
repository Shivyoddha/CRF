class GlowsController < ApplicationController
  before_action :set_glow, only: %i[ show edit update destroy ]

  # GET /glows or /glows.json
  def index
    @glows = Glow.all
  end

  # GET /glows/1 or /glows/1.json
  def show
  end

  # GET /glows/new
  def new
    @glow = Glow.new
    @user=User.find(params[:id])
    @glow.build_equipment_table

  end

  # GET /glows/1/edit
  def edit
  end

  # POST /glows or /glows.json
  def create
    @glow = Glow.new(glow_params)
    @glow.user=current_user
    @glow.status="pending"
    @glow.build_equipment_table


    respond_to do |format|
      if @glow.save
        if @glow.user.role=='student'||@glow.user.role=='faculty'
          GlowMailer.with(id:@glow.id, userid:current_user.id).InternalMail.deliver_later
        else
          GlowMailer.with(id:@glow.id, userid:current_user.id).ExternalMail.deliver_later
        end
        format.html { redirect_to home_index_path, notice: "Glow was successfully created." }
        format.json { render :show, status: :created, location: @glow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @glow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glows/1 or /glows/1.json
  def update
    @glow.status="alloted"
    @glow.build_equipment_table

    respond_to do |format|
      if @glow.update(glow_params)
        GlowsAllotedMailer.with(id:@glow.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_glow_path(@glow), notice: "Glow was successfully updated." }
        format.json { render :show, status: :ok, location: @glow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @glow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glows/1 or /glows/1.json
  def destroy
    @glow.destroy

    respond_to do |format|
      format.html { redirect_to glows_url, notice: "Glow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glow
      @glow = Glow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def glow_params
      params.require(:glow).permit(:sample, :elemental, :coated, :coated_ele, :substarte, :specification, :more, :status, :slotdate, :slottime, :debit,:user_id, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] ,references: [])
    end
end
