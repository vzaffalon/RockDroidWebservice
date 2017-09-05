class Sample < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :sample_photos
  belongs_to :outcrop

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :uuid, message: 'missing_field'
end
