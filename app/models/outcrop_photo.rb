class OutcropPhoto < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :outcrop
end
