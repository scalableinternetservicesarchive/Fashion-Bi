module PhotosHelper
    def cache_key_for_photo_row(photo)
       "photo-#{photo.id}-#{photo.updated_at}" 
    end
end
