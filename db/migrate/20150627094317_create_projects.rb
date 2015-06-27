class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :starts_at
      t.string :ends_at

      t.timestamps null: false
    end
  end
end
