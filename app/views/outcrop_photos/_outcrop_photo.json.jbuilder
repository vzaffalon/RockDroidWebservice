json.extract! outcrop_photo, :id, :uuid, :base64image, :filename, :outcrop_uuid, :created_at, :updated_at
json.url outcrop_photo_url(outcrop_photo, format: :json)
