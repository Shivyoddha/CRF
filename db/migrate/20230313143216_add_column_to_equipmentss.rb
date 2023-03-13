class AddColumnToEquipmentss < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment_tables, :email, :string
  end
end
