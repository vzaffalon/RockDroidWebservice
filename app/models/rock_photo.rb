class RockPhoto < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :rock
end
