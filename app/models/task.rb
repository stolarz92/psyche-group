class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :comments
  has_one :status
  has_one :priority
end
