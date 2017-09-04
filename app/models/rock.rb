class Rock < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :outcrop
  has_many :rock_structure_associations
  has_many :rock_photos

end
