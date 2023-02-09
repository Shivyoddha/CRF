class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :name
    add_column :questions, :name, :string
    add_column :answers, :name, :string
  end
end
