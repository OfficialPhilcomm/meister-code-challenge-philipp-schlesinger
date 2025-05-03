class CreateTaskDependencies < ActiveRecord::Migration[8.0]
  def change
    create_table :task_dependencies do |t|
      t.references :task, foreign_key: true
      t.references :dependent_on, foreign_key: { to_table: :tasks }

      t.timestamps
    end
  end
end
