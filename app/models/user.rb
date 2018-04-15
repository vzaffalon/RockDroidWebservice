class User < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :projects, dependent: :destroy

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :email, message: 'missing_field'
  validates_presence_of :password_hash, message: 'missing_field'

  before_create :generate_token

  protected

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(uuid: random_token)
    end
  end
end
