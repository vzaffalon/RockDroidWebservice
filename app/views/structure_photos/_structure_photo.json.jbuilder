json.extract! structure_photo, :id, :uuid, :base64image, :filename, :created_at, :updated_at
json.url structure_photo_url(structure_photo, format: :json)
