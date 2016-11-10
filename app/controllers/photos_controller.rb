class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      flash[:notice] = 'Photo was successfully uploaded.'
      #picUrl = "localhost:3000" + @photo.image.url
      #print picUrl
      #tag_response = ClarifaiRuby::TagRequest.new.get(picUrl)
      #print tag_response.tag_images
      redirect_to action: "index"
     else
       render action: 'new'
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "The photo has been deleted."
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
    params.require(:photo).permit(:image, :user_id, :color, :category)
  end
end
