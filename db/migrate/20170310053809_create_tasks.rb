class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, :null => false
      t.string :content, :null => false
      t.integer :status, :null => false
      t.integer :priority, :null => false
      t.references :task_category, foreign_key: true

      t.timestamps
    end
  end
end
