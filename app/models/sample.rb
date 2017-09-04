class Sample < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :sample_photos
  belongs_to :outcrop
end
