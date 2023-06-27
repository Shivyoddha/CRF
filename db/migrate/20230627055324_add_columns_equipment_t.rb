class AddColumnsEquipmentT < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment_tables,:sample,:integer
    add_column :equipment_tables,:file_name,:string
  end
end
