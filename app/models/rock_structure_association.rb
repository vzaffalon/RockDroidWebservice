class RockStructureAssociation < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :outcrop
  belongs_to :rock
  belongs_to :structure
end
