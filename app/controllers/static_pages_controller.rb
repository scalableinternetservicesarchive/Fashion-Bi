class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:feed, :wardrobe]

  # home page
  def home
  end

  # old fb login page
  def login
  end

  # user home page
  def feed
    #@photos = Photo.where(user_id: current_user.email)


    @photos = Array.new # for storing the photos for feed
    @stored_recs = OutfitRec.where(user_id: current_user.email)
    if @stored_recs.empty?
      print "have to generate new recs"
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

      @it = 0
      while @it < @sz_min do
        @outfit_rec = OutfitRec.new

        @outfit_rec.user_id = current_user.email

        @outfit_rec.clothes_ids = "#{@shirts[@it].id} #{@jackets[@it].id} #{@pants[@it].id} #{@shoes[@it].id}"

        @outfit_rec.date = DateTime.now

        @outfit_rec.save

        @photos.push(@shirts[@it].image)
        @photos.push(@jackets[@it].image)
        @photos.push(@pants[@it].image)
        @photos.push(@shoes[@it].image)
        @photos.push(@outfit_rec.id)
        @photos.push(@outfit_rec.user_id)

        @it = @it+1
      end
    else
      print "have storec recs; use those"
      @stored_recs.each do |rec|
        # rec.delete
        @c_ids = rec.clothes_ids.split(" ").map { |s| s.to_i }
        @c_ids.each do |c_id|
          @c_photo = Photo.where(id: c_id)
          @photos.push(@c_photo.first.image)
        end
        @photos.push(rec.id)
        @photos.push(rec.user_id)
      end
    end

  end

  # user wardrobe
  def wardrobe
  end

end
