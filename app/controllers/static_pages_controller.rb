class StaticPagesController < ApplicationController
  def home
    @wardrobe = [
      'https://i.imgur.com/DMR2S90.jpg',
      'https://dfqickngpn7t8.cloudfront.net/AJdAgnqCST4iPtnUxiGtTz/cache=expiry:max/rotate=deg:exif/rotate=deg:0/resize=width:1100,fit:crop/output=format:jpg,compress:true,quality:95/M3sQOTG6QcKomxx4GNgG'
    ]
    @photos = Photo.where(user_id:'whatever')
  end


  def login
  end
end
