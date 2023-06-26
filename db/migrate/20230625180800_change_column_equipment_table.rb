class ChangeColumnEquipmentTable < ActiveRecord::Migration[6.1]
  def change
    change_column :equipment_tables, :testing, :integer
    change_column :equipment_tables, :gst_applied, :integer
    change_column :equipment_tables, :consulting, :integer
  end
end
