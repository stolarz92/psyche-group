class AddPriorityReferenceToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :priority, index: true
    add_foreign_key :tasks, :priorities
  end
end
