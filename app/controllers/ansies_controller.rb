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
    today=Date.today
    value=today.wday-1
if value==0||value==1
batches = [

  { name: " #{(today.end_of_week(:wednesday)).strftime('%B %d')} to #{(today.end_of_week(:wednesday) + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) ), end_date: (today.end_of_week(:wednesday) + 1.day), dates: [] },
  { name: " #{(today.end_of_week(:friday)).strftime('%B %d')} to #{(today.end_of_week(:friday) + 2.day).strftime('%B %d')}", start_date: (today.end_of_week(:friday) ), end_date: (today.end_of_week(:friday)  + 2.days), dates: [] },
  { name: " #{(today.end_of_week(:monday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:monday)+1.weeks ), end_date: (today.end_of_week(:monday)+1.weeks + 1.day), dates: [] },
  { name: " #{(today.end_of_week(:wednesday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:wednesday) +1.weeks+ 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) + 1.weeks), end_date: (today.end_of_week(:wednesday) + 1.weeks + 1.day), dates: [] },
  { name: " #{(today.end_of_week(:friday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:friday) +1.weeks+ 2.day).strftime('%B %d')}", start_date: (today.end_of_week(:friday)+1.weeks ), end_date: (today.end_of_week(:friday)+1.weeks  + 2.days), dates: [] },
  { name: " #{(today.end_of_week(:monday)+2.weeks).strftime('%B %d')} to #{(today.end_of_week(:monday)+2.weeks + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:monday) + 2.weeks), end_date: (today.end_of_week(:monday)+ 2.weeks + 1.day), dates: [] }
]
elsif value==2||value==3
batches = [
  { name: " #{(today.end_of_week(:friday)).strftime('%B %d')} to #{(today.end_of_week(:friday) + 2.day).strftime('%B %d')}", start_date: (today.end_of_week(:friday) ), end_date: (today.end_of_week(:friday)  + 2.days), dates: [] },
  { name: " #{(today.end_of_week(:monday)).strftime('%B %d')} to #{(today.end_of_week(:monday) + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:monday) ), end_date: (today.end_of_week(:monday) + 1.day), dates: [] },
  { name: " #{(today.end_of_week(:wednesday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:wednesday) + 1.weeks+1.days).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday)+1.weeks ), end_date: (today.end_of_week(:wednesday) + 1.weeks+1.days), dates: [] },
  { name: " #{(today.end_of_week(:friday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:friday) +1.weeks+ 2.day).strftime('%B %d')}", start_date: (today.end_of_week(:friday)+1.weeks ), end_date: (today.end_of_week(:friday)+1.weeks  + 2.days), dates: [] },
  { name: " #{(today.end_of_week(:monday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:monday) + 1.weeks), end_date: (today.end_of_week(:monday)+ 1.weeks + 1.day), dates: [] },
  { name: " #{(today.end_of_week(:wednesday)+2.weeks).strftime('%B %d')} to #{(today.end_of_week(:wednesday) +2.weeks+ 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) + 2.weeks), end_date: (today.end_of_week(:wednesday) + 2.weeks + 1.day), dates: [] }
]
else
  batches = [
    { name: " #{(today.end_of_week(:monday)).strftime('%B %d')}   to    #{(today.end_of_week(:monday)+1.day).strftime('%B %d')}    ", start_date: (today.end_of_week(:monday) ), end_date: (today.end_of_week(:monday) + 1.day), dates: [] },
    { name: " #{(today.end_of_week(:wednesday)).strftime('%B %d')} to #{(today.end_of_week(:wednesday) + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) ), end_date: (today.end_of_week(:wednesday) + 1.day), dates: [] },
    { name: " #{(today.end_of_week(:friday)).strftime('%B %d')} to #{(today.end_of_week(:friday)+ 2.day).strftime('%B %d')}", start_date: (today.end_of_week(:friday) ), end_date: (today.end_of_week(:friday) + 2.days), dates: [] },
    { name: " #{(today.end_of_week(:monday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:monday) + 1.weeks), end_date: (today.end_of_week(:monday)+ 1.weeks + 1.day), dates: [] },
    { name: " #{(today.end_of_week(:wednesday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:wednesday) +1.weeks+ 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) + 1.weeks), end_date: (today.end_of_week(:wednesday) + 1.weeks + 1.day), dates: [] },
    { name: " #{(today.end_of_week(:friday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:friday)+1.weeks + 2.day).strftime('%B %d')}", start_date: (today.end_of_week(:friday)+2.weeks), end_date: (today.end_of_week(:friday) +1.weeks + 2.days), dates: [] }
]
    # { name: " #{(today.end_of_week(:monday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:monday) + 1.weeks), end_date: (today.end_of_week(:monday)+ 1.weeks + 1.day), dates: [] }

end
#   today = Date.today
# week_start = today.beginning_of_week(:friday)
# week_end = today.end_of_week(:friday)


# You can then use the `batches` array to display the available batches in your view


# Populate the dates array for each batch
batches.each do |batch|
  date = batch[:start_date]
  while date <= batch[:end_date]
    batch[:dates] << date
    date += 1.day
  end
end
if value == 0 || value == 1
  customisedbatches = [
    { name: "#{(today.end_of_week(:wednesday)).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday)) },
    { name: "#{(today.end_of_week(:friday)).strftime('%B %d')}", start_date: (today.end_of_week(:friday)) },
    { name: "#{(today.end_of_week(:monday) + 1.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:monday) + 1.weeks) },
    { name: "#{(today.end_of_week(:wednesday) + 1.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) + 1.weeks) },
    { name: "#{(today.end_of_week(:friday) + 1.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:friday) + 1.weeks) },
    { name: "#{(today.end_of_week(:monday) + 2.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:monday) + 1.weeks) }
  ]
elsif value == 2 || value == 3
  customisedbatches = [
    { name: "#{(today.end_of_week(:friday)).strftime('%B %d')}", start_date: (today.end_of_week(:friday)) },
    { name: "#{(today.end_of_week(:monday)).strftime('%B %d')} ", start_date: (today.end_of_week(:monday)) },
    { name: "#{(today.end_of_week(:wednesday) + 1.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) + 1.weeks) },
    { name: "#{(today.end_of_week(:friday) + 1.weeks).strftime('%B %d')} ", start_date: (today.end_of_week(:friday) + 1.weeks) },
    { name: "#{(today.end_of_week(:monday) + 1.weeks).strftime('%B %d')} ", start_date: (today.end_of_week(:monday) + 1.weeks) },
    { name: "#{(today.end_of_week(:wednesday) + 2.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) + 2.weeks) }
  ]
else
  customisedbatches = [
    { name: "#{(today.end_of_week(:monday)).strftime('%B %d')}", start_date: (today.end_of_week(:monday)) },
    { name: "#{(today.end_of_week(:wednesday)).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday)) },
    { name: " #{(today.end_of_week(:friday)+1.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:friday)+1.weeks ) },
    { name: " #{(today.end_of_week(:monday)+1.weeks).strftime('%B %d')} ", start_date: (today.end_of_week(:monday) + 1.weeks) },
    { name: " #{(today.end_of_week(:wednesday)+1.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:wednesday) + 1.weeks)},
    { name: " #{(today.end_of_week(:friday)+2.weeks).strftime('%B %d')}", start_date: (today.end_of_week(:friday)+2.weeks ) }
  ]

end

if value==0||value==1
customisedend = [

  { name: "  #{(today.end_of_week(:wednesday) + 1.day).strftime('%B %d')}", end_date: (today.end_of_week(:wednesday) + 1.day) },
  { name: " #{(today.end_of_week(:friday) + 2.day).strftime('%B %d')}", end_date: (today.end_of_week(:friday)  + 2.days) },
  { name: "  #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}",  end_date: (today.end_of_week(:monday)+1.weeks + 1.day) },
  { name: "  #{(today.end_of_week(:wednesday) +1.weeks+ 1.day).strftime('%B %d')}", end_date: (today.end_of_week(:wednesday) + 1.weeks + 1.day) },
  { name: "  #{(today.end_of_week(:friday) +1.weeks+ 2.day).strftime('%B %d')}",  end_date: (today.end_of_week(:friday)+1.weeks  + 2.days) },
  { name: "  #{(today.end_of_week(:monday)+2.weeks + 1.day).strftime('%B %d')}", end_date: (today.end_of_week(:monday)+ 2.weeks + 1.day) }
]
elsif value==2||value==3
customisedend = [
  { name: " #{(today.end_of_week(:friday) + 2.day).strftime('%B %d')}",  end_date: (today.end_of_week(:friday)  + 2.days) },
  { name: "  #{(today.end_of_week(:monday) + 1.day).strftime('%B %d')}",  end_date: (today.end_of_week(:monday) + 1.day)},
  { name: " #{(today.end_of_week(:wednesday) + 1.weeks+1.days).strftime('%B %d')}", end_date: (today.end_of_week(:wednesday) + 1.weeks+1.days) },
  { name: "  #{(today.end_of_week(:friday) +1.weeks+ 2.day).strftime('%B %d')}", end_date: (today.end_of_week(:friday)+1.weeks  + 2.days) },
  { name: " #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}",  end_date: (today.end_of_week(:monday)+ 1.weeks + 1.day) },
  { name: "  #{(today.end_of_week(:wednesday) +2.weeks+ 1.day).strftime('%B %d')}", end_date: (today.end_of_week(:wednesday) + 2.weeks + 1.day) }
]
else
  customisedend = [
    { name: "  #{(today.end_of_week(:monday)+1.day).strftime('%B %d')}    ",  end_date: (today.end_of_week(:monday) + 1.day) },
    { name: " #{(today.end_of_week(:wednesday) + 1.day).strftime('%B %d')}", end_date: (today.end_of_week(:wednesday) + 1.day)},
    { name: "  #{(today.end_of_week(:friday)+1.weeks + 2.day).strftime('%B %d')}",  end_date: (today.end_of_week(:friday)+1.weeks  + 2.days) },
    { name: " #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}", end_date: (today.end_of_week(:monday)+ 1.weeks + 1.day) },
    { name: " #{(today.end_of_week(:wednesday) +1.weeks+ 1.day).strftime('%B %d')}",  end_date: (today.end_of_week(:wednesday) + 1.weeks + 1.day) },
    { name: "  #{(today.end_of_week(:friday) +2.weeks+ 2.day).strftime('%B %d')}",  end_date: (today.end_of_week(:friday)+2.weeks  + 2.days) }

]
    # { name: " #{(today.end_of_week(:monday)+1.weeks).strftime('%B %d')} to #{(today.end_of_week(:monday)+1.weeks + 1.day).strftime('%B %d')}", start_date: (today.end_of_week(:monday) + 1.weeks), end_date: (today.end_of_week(:monday)+ 1.weeks + 1.day), dates: [] }

end









customisedbatches.each do |customisedbatch|
  date = customisedbatch[:startdate]
  customisedbatch[:dates] = [date]
end
customisedend.each do |customisedend|
  date = customisedend[:endate]
  customisedend[:dates] = [date]
end
@customisedbatches=customisedbatches
@customisedend=customisedend
  @batches = batches
    @ansy = Ansy.new
  end

  # GET /ansies/1/edit
  def edit
  end

  # POST /ansies or /ansies.json
  def create
    @ansy = Ansy.new(ansy_params)
    @ansy.user=current_user


    if @ansy.startdate.present? and ( @ansy.startdate.wday==0 || @ansy.startdate.wday==2)
      @ansy.amount=@ansy.sysno*200*2
    elsif @ansy.startdate.present? and (@ansy.startdate.wday==4)
      @ansy.amount=@ansy.sysno*200*3
    end
    if @ansy.customstart.present? and @ansy.customend.present?

        @ansy.amount=(@ansy.customend - @ansy.customend).to_i*@ansy.sysno*200

    end
    respond_to do |format|
      if @ansy.save
        AnsysMailer.with(id:@ansy.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to ansy_url(@ansy), notice: "Ansy was successfully created." }
        format.json { render :show, status: :created, location: @ansy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ansy.errors, status: :unprocessable_entity }
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
      params.require(:ansy).permit(:sysno, :slotdate,:startdate,:enddate,:customstart,:customend, :purpose, :amount, :debit,:user_id)
    end
end
