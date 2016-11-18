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
    @photos = Photo.where(user_id: current_user.email)
  end

  # user wardrobe
  def wardrobe
  end

end
