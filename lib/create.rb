require_relative "../db/setup"
require_relative '../lib/all'

class Task

  def initialize
    @tasks = []
  end

  def greeting
    #loop here
    puts "Would you like to add (1), mark a task complete (2) or edit a task (3)?"
    answer = gets.chomp.to_i
    case answer
      when 1
        prompt_for_task
      when 2
        print_tasks_to_screen
        update_completed
      when 3
        edit_task
      else
        puts "That is not a valid choice." #loop to start
    end
  end


  def prompt_for_task
    puts "What task would you like to add to your list?"
    task = gets.chomp
    add_todo(task)
    puts "You have added '#{task}' to your list."
    print_tasks_to_screen
  end

  def add_todo(task)
    todo = Todo.find_or_create_by(task: task) #todo variable here is only one row
    @tasks << todo
  end

  def update_completed #need ids to print
    puts "Which task number would you like to mark complete?"
    number = gets.chomp.to_i
    done = Todo.find_or_create_by(id: number)
    done.update(completed: true)
  end

  def edit_task
    puts "Which task number would you like to change?"
    number = gets.chomp.to_i
    taskbynumber = Todo.find(number) #or (id: number)
    puts "Please enter the edit"
    edited_task = Todo.find_or_create_by(task: taskbynumber)
  end


  def print_tasks_to_screen #can't get id's to print to screen
    puts "-*" * 25
    Todo.all.each do |task, completed|
      puts "To do: #{task.task} \t\tCompleted? : #{task.completed}"
    end
    puts "-*" * 25
  end

  #get clarification on this
  # def print_task
  #   @tasks.each |todo| #changed from task to todo, this is acting weird, changing colors of text beneath it
  #   todo.task
  # end
end

