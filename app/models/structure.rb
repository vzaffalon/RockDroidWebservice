class Structure < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :outcrop
  has_many :rock_structure_associations
  has_many :structure_photo

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :uuid, message: 'missing_field'
end
