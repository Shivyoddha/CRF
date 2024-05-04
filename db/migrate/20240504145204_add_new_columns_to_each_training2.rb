class AddNewColumnsToEachTraining2 < ActiveRecord::Migration[6.1]
  def change
    add_column :training1s, :status, :string, default: "pending"
    add_column :training2s, :status, :string, default: "pending"
    add_column :training3s, :status, :string, default: "pending"
    add_column :training4s, :status, :string, default: "pending"
  end
end
