require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_controller'
require_relative 'router'

repository = TaskRepository.new
controller = TasksController.new(repository)

router = Router.new(controller)
router.run





# t1 = Task.new('Aprender MVC')
# #puts t1.description # => 'Aprender MVC'
# #puts t1.done? # => false
# t1.done!
# #puts t1.done? # => true


# repository = TaskRepository.new
# repository.add_task(t1)

# t2 = Task.new('fazer flashcards')

# repository.add_task(t2)

# tasks = repository.all
# tasks.each_with_index do |task, index|
#   puts "#{index} #{task.description}"
# end

# puts 'remove task 1'
# # repository.remove(1)

# first_task = repository.find(0)
# puts "A primeira tarefa é #{first_task.description}"