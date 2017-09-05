class RockPhoto < ApplicationRecord
  self.primary_key = 'uuid'
  belongs_to :rock

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :uuid, message: 'missing_field'
end
