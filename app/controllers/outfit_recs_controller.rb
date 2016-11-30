class OutfitRecsController < ApplicationController
  before_action :set_outfit_rec, only: [:show, :edit, :update, :destroy]

  # GET /outfit_recs
  # GET /outfit_recs.json
  def index
    @shirts = Photo.where("user_id = ? AND category = \'shirt\'", current_user.email).order("RANDOM()")
    @jackets = Photo.where("user_id = ? AND category = \'jacket\'", current_user.email).order("RANDOM()")
    @pants = Photo.where("user_id = ? AND category = \'pants\'", current_user.email).order("RANDOM()")
    @shoes = Photo.where("user_id = ? AND category = \'shoes\'", current_user.email).order("RANDOM()")

    @sz_shirts = @shirts.size
    @sz_jackets = @jackets.size
    @sz_pants = @pants.size
    @sz_shoes = @shoes.size

    @sz_min = @sz_shirts
    if @sz_min > @sz_jackets
      @sz_min = @sz_jackets
    end
    if @sz_min > @sz_pants
      @sz_min = @sz_pants
    end
    if @sz_min > @sz_shoes
      @sz_min = @sz_shoes
    end

    @outfit_recs = Array.new

    @it = 0
    while @it < @sz_min do
      @outfit_rec = OutfitRec.new

      @outfit_rec.user_id = current_user.email

      @ids = Array.new
      @ids.push(@shirts[@it].id)
      @ids.push(@jackets[@it].id)
      @ids.push(@pants[@it].id)
      @ids.push(@shoes[@it].id)

      @outfit_rec.clothes_ids = @ids

      @outfit_rec.date = "20xx"

      @outfit_recs.push(@outfit_rec)

      @it = @it+1
    end
  end

  # GET /outfit_recs/1
  # GET /outfit_recs/1.json
  def show
  end

  # GET /outfit_recs/new
  def new
    @outfit_rec = OutfitRec.new
  end

  # GET /outfit_recs/1/edit
  def edit
  end

  # POST /outfit_recs
  # POST /outfit_recs.json
  def create
    @outfit_rec = OutfitRec.new(outfit_rec_params)

    respond_to do |format|
      if @outfit_rec.save
        format.html { redirect_to @outfit_rec, notice: 'Outfit rec was successfully created.' }
        format.json { render :show, status: :created, location: @outfit_rec }
      else
        format.html { render :new }
        format.json { render json: @outfit_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outfit_recs/1
  # PATCH/PUT /outfit_recs/1.json
  def update
    respond_to do |format|
      if @outfit_rec.update(outfit_rec_params)
        format.html { redirect_to @outfit_rec, notice: 'Outfit rec was successfully updated.' }
        format.json { render :show, status: :ok, location: @outfit_rec }
      else
        format.html { render :edit }
        format.json { render json: @outfit_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outfit_recs/1
  # DELETE /outfit_recs/1.json
  def destroy
    @outfit_rec.destroy
    respond_to do |format|
      format.html { redirect_to outfit_recs_url, notice: 'Outfit rec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outfit_rec
      @outfit_rec = OutfitRec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outfit_rec_params
      params.require(:outfit_rec).permit(:user_id, :clothes_ids, :date)
    end
end
