class Project < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :stages, dependent: :destroy
  belongs_to :user

  before_create :generate_token

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  protected

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Project.exists?(uuid: random_token)
    end
  end


end
