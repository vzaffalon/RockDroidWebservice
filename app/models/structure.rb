class Structure < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :outcrop
  has_many :rock_structure_associations, dependent: :destroy
  has_many :structure_photos, dependent: :destroy
  validates_presence_of :description, :unless => lambda {self.structure_type == 1}
  validates_presence_of :dip_direction, :unless => lambda {self.structure_type == 0}
  validates_presence_of :dip, :unless => lambda {self.structure_type == 0}
  validates_presence_of :name, :unless => lambda {self.structure_type == 0}
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
        break random_token unless Structure.exists?(uuid: random_token)
      end
    end
  end
end
