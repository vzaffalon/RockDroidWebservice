class Stage < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :outcrops
  belongs_to :project

  before_create do
    self.persisted_time = DateTime.now.strftime('%Q')
  end

  validates_presence_of :uuid, message: 'missing_field'
end
