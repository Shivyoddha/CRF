class Addfirstnametouser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :firstname

  end
end
