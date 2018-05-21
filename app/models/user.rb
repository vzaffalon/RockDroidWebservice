class User < ApplicationRecord
  include BCrypt
  self.primary_key = 'uuid'
  has_many :projects, dependent: :destroy

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :email, message: 'missing_field'

  before_create :generate_token

  protected

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(uuid: random_token)
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
