class ChangeProjectColumns < ActiveRecord::Migration
  def change
  	remove_column :projects, :starts_at
  	add_column :projects, :starts_at,  :datetime
  	remove_column :projects, :ends_at
  	add_column :projects, :ends_at,  :datetime
  end
end
