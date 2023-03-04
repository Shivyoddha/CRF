class GloveBoxesController < ApplicationController
  before_action :set_glove_box, only: %i[ show edit update destroy ]

  # GET /glove_boxes or /glove_boxes.json
  def index
    @glove_boxes = GloveBox.all
  end

  # GET /glove_boxes/1 or /glove_boxes/1.json
  def show
  end

  # GET /glove_boxes/new
  def new
    @glove_box = GloveBox.new
  end

  # GET /glove_boxes/1/edit
  def edit
  end

  # POST /glove_boxes or /glove_boxes.json
  def create
    @glove_box = GloveBox.new(glove_box_params)
    @glove_box.user=current_user
    @glove_box.status="pending"
    respond_to do |format|
      if @glove_box.save
        GloveBoxMailer.with(id:@glove_box.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to glove_box_url(@glove_box), notice: "Glove box was successfully created." }
        format.json { render :show, status: :created, location: @glove_box }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @glove_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glove_boxes/1 or /glove_boxes/1.json
  def update
      @glove_box.status="alloted"
    respond_to do |format|
      if @glove_box.update(glove_box_params)
        GloveBoxAllotedMailer.with(id:@glove_box.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_glove_path(@glove_box), notice: "Glove box was successfully updated." }
        format.json { render :show, status: :ok, location: @glove_box }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @glove_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glove_boxes/1 or /glove_boxes/1.json
  def destroy
    @glove_box.destroy

    respond_to do |format|
      format.html { redirect_to glove_boxes_url, notice: "Glove box was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glove_box
      @glove_box = GloveBox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def glove_box_params
      params.require(:glove_box).permit(:weight, :days, :toxicity, :carcinogenic, :incompatible, :more, :debit, :slotdate, :slottime, :status,:user_id, references: [])
    end
end
