class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
