class ChangeTasks < ActiveRecord::Migration
  def up
      rename_column :tasks, :complete?, :completed
    end
end
