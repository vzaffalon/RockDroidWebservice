json.extract! rock_photo, :id, :uuid, :base64image, :filename, :rock_uuid, :created_at, :updated_at
json.url rock_photo_url(rock_photo, format: :json)
