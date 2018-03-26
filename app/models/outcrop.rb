class Outcrop < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :stage
  has_many :outcrop_photos
  has_many :structure
  has_many :rocks
  has_many :samples
  has_many :rock_structure_associations

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  before_create :generate_token

  protected

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Outcrop.exists?(uuid: random_token)
    end
  end
end
