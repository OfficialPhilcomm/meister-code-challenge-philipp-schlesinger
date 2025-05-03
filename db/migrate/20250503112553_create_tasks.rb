class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false

      t.datetime :deleted_at
      t.datetime :expired_at

      t.references :project, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
