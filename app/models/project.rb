class Project < ActiveRecord::Base
  validates :name, :starts_at, :ends_at, presence: true
  has_many :tasks
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :comments

  def has_member?(user)
    memberships.exists?(user: user)
  end

  def is_owner?(user)
    memberships.exists?(user: user, role: Role.find_by(name: 'owner'))
  end
end
