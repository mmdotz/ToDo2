require 'minitest/autorun'
require 'minitest/pride'
require_relative '../bin/todo.rb'


class TestTodos < Minitest::Test

  def test_class_todo
    skip
    assert(Todo)
  end

  def test_add_todo
    skip
    assert_equal("clean kitchen", Todo.new.add_todo("clean kitchen"))
  end

  def test_prompt
    skip
    assert_equal("What task would you like to add to your list?", Todo.new.prompt_for_task)
  end

  def test_input

  end



end
