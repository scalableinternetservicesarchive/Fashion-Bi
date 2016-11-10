json.extract! photo, :id, :user_id, :category, :color, :created_at, :updated_at
json.url photo_url(photo, format: :json)