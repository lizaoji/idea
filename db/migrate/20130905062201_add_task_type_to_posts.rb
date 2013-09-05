class AddTaskTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :task_type, :string
  end
end
