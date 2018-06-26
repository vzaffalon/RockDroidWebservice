class Stage < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :outcrops, dependent: :destroy
  belongs_to :project

  before_create :generate_token

  validates_presence_of :name
  validates_presence_of :initial_date
  validates_presence_of :project_id

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  protected

  def generate_token
    if self.uuid.nil?
      self.uuid = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Stage.exists?(uuid: random_token)
      end
    end
  end

end
