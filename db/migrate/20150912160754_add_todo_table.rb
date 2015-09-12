class AddTodoTable < ActiveRecord::Migration
  def change
    create_table(:todos) do |t|
      t.column :task, :string
      t.timestamps null: false
    end
  end
end
