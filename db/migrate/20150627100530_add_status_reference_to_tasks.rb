class AddStatusReferenceToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :status, index: true
    add_foreign_key :tasks, :statuses
  end
end
