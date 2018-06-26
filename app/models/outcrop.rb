class Outcrop < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :stage
  has_many :outcrop_photos, dependent: :destroy
  has_many :structures, dependent: :destroy
  has_many :rocks, dependent: :destroy
  has_many :samples, dependent: :destroy
  has_many :rock_structure_associations, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :stage_id

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  before_create :generate_token

  protected

  def generate_token
    if self.uuid.nil?
      self.uuid = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Outcrop.exists?(uuid: random_token)
      end
    end
  end
end
