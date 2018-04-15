class Sample < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :sample_photos, dependent: :destroy
  belongs_to :outcrop

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  before_create :generate_token

  protected

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Sample.exists?(uuid: random_token)
    end
  end
end
