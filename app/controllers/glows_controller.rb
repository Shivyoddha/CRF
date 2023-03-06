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
  end

  # GET /glows/1/edit
  def edit
  end

  # POST /glows or /glows.json
  def create
    @glow = Glow.new(glow_params)
    @glow.user=current_user
    @glow.status="pending"

    respond_to do |format|
      if @glow.save
        GlowMailer.with(id:@glow.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to glow_url(@glow), notice: "Glow was successfully created." }
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
    respond_to do |format|
      if @glow.update(glow_params)
        GlowsAllotedMailer.with(id:@glow.id, userid:current_user.id).Mail.deliver_later

        @glow.status="alloted"
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
      params.require(:glow).permit(:sample, :elemental, :coated, :coated_ele, :substarte, :specification, :more, :status, :slotdate, :slottime, :debit,:user_id,references: [])
    end
end
