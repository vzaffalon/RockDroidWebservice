class Project < ApplicationRecord
  self.primary_key = 'uuid'
  has_many :stages
  belongs_to :user
end
