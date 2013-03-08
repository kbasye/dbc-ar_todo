# require_relative '../config/application'

class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
    t.integer :id 
    t.integer :view_id
    t.text :description
    t.boolean :complete?, :default => false
    t.date :created_at
    t.date :updated_at
    end
  end

  def down
    drop_table :tasks
  end

end
