class AddColumnEquipmentTable < ActiveRecord::Migration[6.1]
  def change
      add_column :equipment_tables,:submission_time,:datetime
      add_column :equipment_tables,:block_status,:string,default: "unblock"
      add_reference :equipment_tables, :user, foreign_key: true
  end
end
