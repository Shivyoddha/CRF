class AddReferenceToIon < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :ion_chromotography, foreign_key: true
  end
end
