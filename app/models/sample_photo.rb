class SamplePhoto < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :sample
end
