class StaticPagesController < ApplicationController

  # home page
  def home
  end

  # old fb login page
  def login
  end

  # user home page
  def feed
    @photos = Photo.where(user_id:'test')
  end

  # user wardrobe
  def wardrobe
  end

end
