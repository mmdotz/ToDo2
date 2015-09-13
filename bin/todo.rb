require_relative '../lib/create' #required!!
require 'pry'


Task.new.greeting
# Task.new.print_tasks_to_screen
binding pry


# a list of todos is an array of todos (row in table), not tasks
#todo = Task.create(task: "feed the dog") to hardcode
#todo.task is not a getter, only a setter

