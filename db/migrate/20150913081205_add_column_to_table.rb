class AddColumnToTable < ActiveRecord::Migration
  def change
    add_column(:todos) do |t|
      t.column :completed, :boolean, default: false
  end
end
