require_relative "../db/setup"  # ~> Errno::ENOENT: No such file or directory @ rb_sysopen - config/database.yml
require_relative '../lib/all'

class Task

  def initialize
    @tasks = []
  end

  def prompt_for_task
    puts "What task would you like to add to your list?"
    task = gets.chomp
    add_todo(task)
    puts "You have added '#{task}' to your list."
    @tasks
  end

  def add_todo(task)
    todo = Todo.find_or_create_by(task: task) #todo variable here is only one row
    @tasks << todo
  end


  def print_tasks_to_screen
    puts "-*" * 25
    Todo.all.each do |task, completed|
      puts "To do: #{task.task} \t\tCompleted? : #{task.completed}"
    end
    puts "-*" * 25
  end

  # def print_task
  #   @tasks.each |todo| #changed from task to todo, this is acting weird, changing colors of text beneath it
  #   todo.task
  # end


end


