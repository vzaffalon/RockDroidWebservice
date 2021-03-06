class Sample < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :sample_photos, dependent: :destroy
  belongs_to :outcrop
  validates_presence_of :name
  validates_presence_of :outcrop_id

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  before_create :generate_token

  protected

  def generate_token
    if self.uuid.nil?
      self.uuid = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Sample.exists?(uuid: random_token)
      end
    end
  end
end
