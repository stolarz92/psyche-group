class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :role
  has_one :role
end