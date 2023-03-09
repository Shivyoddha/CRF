class AddReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :hr_fesem_j, foreign_key: true
    add_reference :equipment_tables, :three_d_non_contact, foreign_key: true
    add_reference :equipment_tables, :tga_fttr, foreign_key: true

  end
end
