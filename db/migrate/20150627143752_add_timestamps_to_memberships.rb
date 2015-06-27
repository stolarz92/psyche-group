class AddTimestampsToMemberships < ActiveRecord::Migration
  def change_table
    add_column(:memberships, :created_at, :datetime)
    add_column(:memberships, :updated_at, :datetime)
  end
end
