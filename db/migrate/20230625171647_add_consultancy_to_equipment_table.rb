class AddConsultancyToEquipmentTable < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment_tables, :consultancy_rate, :float
  end
end
