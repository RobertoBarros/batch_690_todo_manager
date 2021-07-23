class Router

  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_actions
    puts '1 - Create a Task'
    puts '2 - List all Taks'
    puts '3 - Remove a Task'
    puts '4 - Mark task as done'
    puts 'Enter option:'
  end

  def dispatch(action)
    case action
    when 1 then @controller.create
    when 2 then @controller.list
    when 3 then @controller.remove
    when 4 then @controller.mark_as_done
    end
  end
end