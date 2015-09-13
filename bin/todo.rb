require_relative '../lib/create' #required!!
require 'pry'



Task.new.prompt_for_task
Task.new.print_tasks_to_screen

# a list of todos is an array of todos (row in table), not tasks
#todo = Task.create(task: "feed the dog") to hardcode
#todo.task is not a getter, only a setter

# ~> Errno::ENOENT
# ~> No such file or directory @ rb_sysopen - config/database.yml
