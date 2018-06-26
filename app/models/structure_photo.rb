class StructurePhoto < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :structure

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  before_create :generate_token

  protected

  def generate_token
    if self.uuid.nil?
      self.uuid = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless StructurePhoto.exists?(uuid: random_token)
      end
    end
  end
end
