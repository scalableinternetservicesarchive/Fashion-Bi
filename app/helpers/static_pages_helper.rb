module StaticPagesHelper
	def cache_key_for_rec_collage(photo)
		"photo-#{photo[0]}-#{photo[1]}-#{photo[2]}-#{photo[3]}-#{photo[4]}-#{photo[5]}"
	end
	def cache_key_for_feed
		"feed-#{OutfitRec.maximum(:date)}"
	end
end
