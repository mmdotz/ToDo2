require 'minitest/autorun'
require 'minitest/pride'
require_relative '../bin/todo.rb'


class TestTodos < Minitest::Test

  def test_class_todo
    assert(Todo)
  end

  def test_add_todo
    assert_equal("clean kitchen", Todo.new.add_todo("clean kitchen"))
  end




end
