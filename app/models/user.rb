class User < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :projects

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :uuid, message: 'missing_field'
end
