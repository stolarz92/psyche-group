class Role < ActiveRecord::Base
  has_one :membership
end
