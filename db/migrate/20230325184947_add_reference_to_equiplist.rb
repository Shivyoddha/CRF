class AddReferenceToEquiplist < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :equiplist, foreign_key: true
  end
end
