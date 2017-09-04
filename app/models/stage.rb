class Stage < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :outcrops
  belongs_to :project
end
