class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.where(user_id: current_user.email)
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
    puts "Edit params"
    puts params.inspect
    @photo = Photo.find(params["id"])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    #Dummy URL set up for localhost
    #picUrl = "http://35.163.205.62/system/photos/images/000/000/001/square/plain-blue-shirt-front-and-back-72hi3bcb_%281%29.jpg?1479202484"
    final_color = ""
    final_tag = ""
    @photo.user_id = current_user.email
    if @photo.save == false
      render action: 'new'
    end

    if request.host != "localhost"

      picUrl = "http://" + request.host + @photo.image.url(:square)
      Rails.logger.info "UPLOADED PICTURE URL: "
      Rails.logger.info picUrl
      tag_response = ClarifaiRuby::TagRequest.new.get(picUrl)
      tags = tag_response.tag_images.first.tags
      color_response = ClarifaiRuby::ColorRequest.new.get(picUrl)
      colors = color_response.colors

      Rails.logger.info colors
      Rails.logger.info tags

      #determine the photo tag
      tags.each do |tag|
        case tag.word
          when "shirt"
            final_tag = "shirt"
          when "pants"
            final_tag = "pants"
          when "jacket"
            final_tag = "jacket"
          when "shoes"
            final_tag = "shoes"
        end
      end
      # TODO: Prompt user to retake photo if no tag is chosen

      color_list = ["red", "white", "blue", "green", "black", "brown", "purple", "pink"]
      maxDensity = 0
      maxDensityColor = ""

      colors.each do |colorHash|
        currDensity = colorHash["density"]
        if maxDensity < currDensity
          maxDensity = currDensity
          maxDensityColor = colorHash["w3c"]["name"]
        end
      end

      # TODO: Assumes only one color per item
      color_list.each do |goldenColor|
        if maxDensityColor.downcase.include? goldenColor
          final_color = goldenColor
          break
        end
      end
    end
    # TODO: Prompt user to retake photo if no color is chosen

    @photo.color = final_color
    @photo.category = final_tag

    if @photo.save
      flash[:notice] = 'Photo was successfully uploaded.'
      redirect_to action: "index"
    else
       render action: 'new'
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    #@photo.destroy
    flash[:notice] = "The photo has been edited."
    redirect_to action: "index"
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
    params.require(:photo).permit(:image)
  end
end
