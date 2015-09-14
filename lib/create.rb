require_relative "../db/setup"
require_relative '../lib/all'

class Task

  def initialize
    @tasks = []
  end

  def greeting
    #loop here
    puts "Would you like to add (1), mark a task complete (2), edit a task (3) or delete (4)?"
    answer = gets.chomp.to_i
    case answer
      when 1
        prompt_for_task
      when 2
        print_tasks_to_screen
        update_completed
      when 3 #not working
        edit_task
      when 4
        delete_task
      else
        puts "That is not a valid choice." #loop to start
    end
  end


  def prompt_for_task
    puts "What task would you like to add to your list?"
    task = gets.chomp
    add_todo(task)
    puts "You have added '#{task}' to your list."
    # print_tasks_to_screen
    print_tasks_to_screen
  end

  def add_todo(task)
    todo = Todo.find_or_create_by(task: task) #todo variable here is only one row
    @tasks << todo
  end

  def update_completed #need ids to print
    puts "Which task number would you like to mark complete?"
    number = gets.chomp.to_i
    done = Todo.find(number)
    done.update(completed: true)
    print_tasks_to_screen
  end

  def edit_task #not working
    print_tasks_to_screen
    puts "Which task number would you like to change?"
    number = gets.chomp.to_i
    # taskbynumber = Todo.find(number) #or (id: number)?
    puts "Please enter the new task (edit)"
    edited_task = gets.chomp
    done = Todo.find_by(id: number)
    done.update(task: edited_task) #creating a new task not editing
    print_tasks_to_screen
  end

  def delete_task
    print_tasks_to_screen
    puts "Which task number would you like to delete?"
    number = gets.chomp.to_i
    taskbynumber = Todo.find(number)
    deleted = Todo.delete(taskbynumber)
    print_tasks_to_screen
    puts "Task #{number} -how to pull task from table? was deleted from your list."
  end

  def print_tasks_to_screen
    puts "-*" * 25
    Todo.all.each do |task, completed, id|
      puts "#{task.id}. #{task.task} \t\tCompleted? : #{task.completed}"
    end
    puts "-*" * 25
  end

  #get clarification on this
  # def print_task
  #   @tasks.each do |todo| #changed from task to todo, this is acting weird, changing colors of text beneath it
  #   puts todo.task
  #   end
  # end
end

