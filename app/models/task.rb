# Task needs to be able to do everything List used to do
# Smart objects: Because we can call delete on Task itself e.g. Task.delete(5), we can manage everything in the Task class
# Task attributes:
  # :id
  # :view_id
  # :description
  # :completed?
  # :created_at
  # :updated_at


require 'date'
require 'active_record'

class Task < ActiveRecord::Base

  ########### view #################

  def self.view
    Task.all.each do |task| view(task) end
  end

  def view(task)
    complete_ness = task[:complete?]
    if task[:complete?] == true
      complete_ness = "[ X ]"
    else
      complete_ness = "[__]"
    end
    "#{:view_id}) #{:description} || #{complete_ness}"
  end


  ########### Task methods #################

  def set_view_id
    Task.last[:view_id] + 1
  end

  def self.add(arg)
    # completed should be defaulted at false. Can I exclude it from args? Is this ok?
    # I think so because defaults are set, and we wouldn't want the user to set anything else..?
    # Someone please validate!

    # also, will it let us set view_id like this?
    new_view_id = set_view_id
    Task.create!(:description => arg, :view_id => new_view_id )
    Task.view

  end

  def self.mark_complete(view_id)
    Task.update_all(":completed? = true, :view_id => view_id")
    Task.view
  end

  def self.un_complete(view_id)
    Task.update_all(":completed? = false, :view_id => view_id")
    Task.view
  end

  def self.delete(view_id)
    Task.where(:view_id => view_id).destroy_all
    refresh_view_id(view_id)
    Task.view
  end



  private
  def refresh_view_id(deleted_view)
    Task.find_each do |task| task[:view_id] -= 1 if task[:view_id] > deleted_view 
    end
  end

end

Task.new(description: "This is test description",
         completed?: false,
         created_at: DateTime.now,
         updated_at: DateTime.now)

Task.new(description: "This is test description number 2",
         completed?: false,
         created_at: DateTime.now,
         updated_at: DateTime.now)

Task.new(description: "This is test description number 3",
         completed?: false,
         created_at: DateTime.now,
         updated_at: DateTime.now)

