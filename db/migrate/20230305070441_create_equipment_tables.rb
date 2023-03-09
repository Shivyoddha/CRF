class CreateEquipmentTables < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_tables do |t|
      t.string :username
      t.string :equipname
      t.string :app_no
      t.float :pay
      t.string :debit_head
      t.date :slotd
      t.time :slott
      t.string :dummy

      t.timestamps
    end
  end
end
