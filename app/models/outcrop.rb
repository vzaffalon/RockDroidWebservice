class Outcrop < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :stage
  has_many :outcrop_photos
  has_many :structure
  has_many :rocks
  has_many :samples
  has_many :rock_structure_associations
end
