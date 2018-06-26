class Rock < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :outcrop
  has_many :rock_structure_associations, dependent: :destroy
  has_many :rock_photos, dependent: :destroy
  validates_presence_of :outcrop_id
  validates_presence_of :name
  validates_presence_of :rock_type

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  before_create :generate_token

  protected

  def generate_token
    if self.uuid.nil?
      self.uuid = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Rock.exists?(uuid: random_token)
      end
    end
  end

end
