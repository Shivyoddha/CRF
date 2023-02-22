class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :name
 end
end
