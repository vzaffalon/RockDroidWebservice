class StructurePhoto < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :structure
end
