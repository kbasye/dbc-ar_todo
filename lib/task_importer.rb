require_relative '../app/models/task'

require 'rubygems'
require 'faker'

module TaskImporter
  
  def self.import
    15.times do 
      Task.transaction do
        Task.create!(:description => Faker::Name.name, :view_id => 9)
      end
    end
  end



end
