class AddNametoUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
  end
end
