class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /favorites
  # GET /favorites.json
  def index
    @stored_recs = OutfitRec.where("user_id = ? AND like = ?", current_user.email, 1)
    @photos = Array.new
    @stored_recs.each do |rec|
      @c_ids = rec.clothes_ids.split(" ").map { |s| s.to_i }
      @c_ids.each do |c_id|
        @c_photo = Photo.where(id: c_id)
        @photos.push(@c_photo.first.image)
      end
      @photos.push(rec.id)
      @photos.push(rec.user_id)
    end
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @outfit_id = params[:id]
    @like = params[:like]
    
    OutfitRec.transaction do
        outfit = OutfitRec.lock.find(@outfit_id)
        outfit.like = @like # mark outfit as liked
        outfit.save
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :outfit_id)
    end
end
