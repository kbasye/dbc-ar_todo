
require 'datetime'

class List < ActiveRecord::Base
   
# class List
#   attr_reader   :list
#   attr_accessor :task

#   def initialize
#     @task = task
#     @list = []
#   end

#  def size
#     items.length
#   end

#   def items
#     @list
#   end

#   def add(task_text)
#     add_item = {'id' => (items.size+1).to_s, 'description' => task_text}
#     items << Task.new(add_item)
#   end

#   def delete(task_id)
#     items.reject! { |t| t.id == task_id }
#   end

#   def edit(task_id, description)
#     items.map! do |t| 
#       if t.id == task_id
#         t.description = description 
#       end
#       t 
#     end
#   end 
end
