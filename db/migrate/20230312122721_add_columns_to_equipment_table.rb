class AddColumnsToEquipmentTable < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment_tables, :dept, :string
  end
end
