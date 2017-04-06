class AddUniqueIndexesToTasksAndCategories < ActiveRecord::Migration[5.0]
  def change
    add_index :tasks, :name, :unique => true
    add_index :task_categories, :name, :unique => true
  end
end
