class Todo

  def add_todo
    Todo.new(name: task)
  end

  def prompt_for_task
    puts "What task would you like to add to your list?"
    task = gets.chomp
    puts "You have added #{task} to your list."
  end
end


# Todo.new.prompt_for_task


