class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :comments
  belongs_to :status
  belongs_to :priority
end
