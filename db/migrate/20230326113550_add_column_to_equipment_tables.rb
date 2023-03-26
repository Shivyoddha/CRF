class AddColumnToEquipmentTables < ActiveRecord::Migration[6.1]
  def change
    add_column:equipment_tables,:orgname,:string
  end
end
