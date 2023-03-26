class AddColumnToEquipmentT < ActiveRecord::Migration[6.1]
  def change
    add_column:equipment_tables,:reg_no,:string
    add_column:equipment_tables,:guide,:string
    add_column:equipment_tables,:course,:string
  end
end
