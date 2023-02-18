class RemoveColumnType < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :type
  end
end
