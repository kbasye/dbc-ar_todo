require_relative 'config/application'
require_relative 'app/model/task'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

class TaskMaster
  def initialize()
    raise "Please enter a command after the filename to run this script" unless ARGV.length > 0
    @command = ARGV[0]
    run(@commands)
  end

  def run(command)

    case @command.downcase
    when "list"
      puts Task.view
      # puts "Full task list:"
      # @list.tasks.each do |task|
      #   puts "#{task.id}: #{task.content}"
      end
    when "delete"
      raise "Must delete by task ID (number)" unless /\d+/.match(ARGV[1])
      # input = ""
      # puts "Are you sure you want to delete #{ARGV[1]}? (y/n)"
      # input = gets.chomp
      # if input == "y"
        puts "# of tasks before delete: #{@list.tasks.length}"
        Task.delete(ARGV[1])
        "So accomplished!"
        puts "# of tasks after delete: #{@list.tasks.length}"
      # else
      #   puts "Aborting delete..."
      #   EXIT
      # end
    when "complete"
      # raise "Must complete by task ID (integer)" unless ARGV[1].is_a?(Integer)
      Task.mark_complete(ARGV[1])
    when "add"
      raise "Must add something..." unless ARGV.length > 1
      task_to_add = ""
      ARGV.shift
      Task.add(ARGV.join(" "))
    else
      puts "I can't do that, Dave"
    end
  end
end


TaskMaster.new()
