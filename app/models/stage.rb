class Stage < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :outcrops
  belongs_to :project

  before_create :generate_token

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  protected

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Stage.exists?(uuid: random_token)
    end
  end

end
