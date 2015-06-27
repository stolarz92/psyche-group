class Project < ActiveRecord::Base
  has_many :tasks
  has_many :users, through: :memberships
  has_many :comments
end
