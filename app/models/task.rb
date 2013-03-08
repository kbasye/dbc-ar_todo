require '././config/application'
require 'date'
require 'active_record'

class Task < ActiveRecord::Base

  ########### view #################

  def self.view
    counter = 1
    Task.all.each do |t| 
      t.completed == true ? completeness = "[X]" : completeness = "[ ]"
      puts "#{counter}) #{t.description} || #{completeness}"
      counter += 1
    end
  end

  ########### Task methods #################

  def self.add(arg)
    if Task.last == nil
      new_view_id = 1
    else 
      new_view_id = Task.last.view_id + 1
    end

    Task.create!(:description => arg, :view_id => new_view_id )
    Task.view
  end

  def self.mark_complete(arg)
    query = Task.limit(arg).last
    self.update( query.id, :completed => true )
    Task.view
  end

  def self.un_complete(arg)
    query = Task.limit(arg).last
    self.update( query.id, :completed => false )
    Task.view
  end

  def self.delete(arg)
    query = Task.limit arg
    query.last.destroy
    Task.view
  end
end
