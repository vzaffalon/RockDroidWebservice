class Project < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :stages
  belongs_to :user

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :uuid, message: 'missing_field'
end
