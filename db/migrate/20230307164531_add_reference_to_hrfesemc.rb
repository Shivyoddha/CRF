class AddReferenceToHrfesemc < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :hr_fesem_c, foreign_key: true
  end
end
