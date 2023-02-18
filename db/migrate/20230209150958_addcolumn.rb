class Addcolumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :name
    add_column :questions, :name, :string
    add_column :answers, :name, :string
  end
end
