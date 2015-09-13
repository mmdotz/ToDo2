require_relative "../db/setup"
require_relative '../lib/all'


class Todo



  def prompt_for_task
    puts "What task would you like to add to your list?"
    task = gets.chomp
    add_todo(task)
    puts "You have added #{task} to your list."
  end

  def add_todo(task)
    Todo.new(task: task).save
  end

  def to_s
    "Task: #{self.task}"
  end

end

new_list = Todo.new
new_list.prompt_for_task
new_list.each {|task| puts task}
