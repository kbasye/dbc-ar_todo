require_relative 'config/application'
require_relative 'app/models/task'


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

    when "delete"
      raise "Must delete by task ID (number)" unless /\d+/.match(ARGV[1])

        # puts "# of tasks before delete: #{@list.tasks.length}"
        Task.delete(ARGV[1])
        "So accomplished!"
        # puts "# of tasks after delete: #{@list.tasks.length}"

    when "complete"
      Task.mark_complete(ARGV[1])
    when "uncomplete"
      Task.un_complete(ARGV[1])
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
