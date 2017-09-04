json.extract! sample_photo, :id, :uuid, :base64image, :filename, :sample_uuid, :created_at, :updated_at
json.url sample_photo_url(sample_photo, format: :json)
