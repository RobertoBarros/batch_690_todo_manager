require 'csv'
# REPOSITORY OF TASKS

class TaskRepository
  def initialize
    @tasks = []
    @csv_filename = 'tasks.csv'
    load_csv
  end

  def add_task(task)
    @tasks << task
    save_csv
  end

  def all
    @tasks
  end

  def remove(index)
    @tasks.delete_at(index)
    save_csv
  end

  def find(index)
    @tasks[index]
  end

  def save_csv
    CSV.open(@csv_filename, 'wb') do |csv|
      @tasks.each do |task|
        csv << [task.description, task.done?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_filename) do |row|
      description = row[0]
      done = row[1] == 'true'
      task = Task.new(description)
      task.done! if done
      @tasks << task
    end
  end

end
