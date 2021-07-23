require_relative 'tasks_view'
require_relative 'task'

class TasksController
  def initialize(repository)
    @view = TasksView.new
    @repository = repository
  end

  def create
    # 1. Pegar a descrição da Task
    description = @view.ask_description

    # 2. Criar uma instância da task
    new_task = Task.new(description)

    # 3. Adicionar a instância ao repositório de tasks
    @repository.add_task(new_task)
  end

  def list
    # 1. Pegar todas as task do repositório
    tasks = @repository.all

    # 2. Mostrar cada task para o usuário
    @view.display(tasks)
  end

  def remove
    # 1. Listar todas as tasks
    list
    # 2. Pegar qual o index da task a ser removida
    index = @view.ask_index
    # 3. Pedir ao repositório para remover a task pelo index
    @repository.remove(index)
  end

  def mark_as_done
    # 1. Listar todas as tasks
    list
    # 2. Pegar qual o index da task a ser marcada como done
    index = @view.ask_index
    # 3. Recuperar do repositório a instância da task pelo index
    task = @repository.find(index)
    # 4. Marcar como done!
    task.done!
    @repository.save_csv
  end

end