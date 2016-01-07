require_relative "../db/setup"
require_relative '../lib/all'

class Task

  def initialize
    @tasks = []
  end

  def greeting
    #loop here
    puts "Would you like to add (1), mark a task complete (2), edit a task (3), delete (4) or exit (5)?"
    answer = gets.chomp.to_i
    case answer
      when 1
        prompt_for_task
      when 2
        print_tasks_to_screen
        update_completed
      when 3
        edit_task
      when 4
        delete_task
      when 5
        puts "Goodbye"
        sleep(1)
        exit
      else
        puts "That is not a valid choice."
        greeting
    end
  end


  def prompt_for_task
    puts "What task would you like to add to your list?"
    task = gets.chomp
    add_todo(task)
    puts "You have added '#{task}' to your list."
    print_tasks_to_screen
    greeting
  end

  def add_todo(task)
    todo = Todo.find_or_create_by(task: task)
    @tasks << todo
  end

  def update_completed
    puts "Which task number would you like to mark complete?"
    number = gets.chomp.to_i
    done = Todo.find(number)
    done.update(completed: true)
    print_tasks_to_screen
    greeting
  end

  def edit_task
    print_tasks_to_screen
    puts "Which task number would you like to change?"
    number = gets.chomp.to_i
    puts "Please enter an edited version of #{number}"
    edited_task = gets.chomp
    done = Todo.find_by(id: number)
    done.update(task: edited_task)
    print_tasks_to_screen
    greeting
  end

  def delete_task
    print_tasks_to_screen
    puts "Which task number would you like to delete?"
    number = gets.chomp.to_i
    taskbynumber = Todo.find(number)
    deleted = Todo.delete(taskbynumber)
    print_tasks_to_screen
    puts "Task #{number} was deleted from your list."
    greeting
  end

  def print_tasks_to_screen
    sleep(2)
    puts "-*" * 25
    Todo.all.each do |task|
      puts "#{task.id}. #{task.task} \t\tCompleted? : #{task.completed}"
    end
    puts "-*" * 25
  end

end
