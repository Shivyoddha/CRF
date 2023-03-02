class CreateElectroChemicals < ActiveRecord::Migration[6.1]
  def change
    create_table :electro_chemicals do |t|
      t.integer :sample
      t.string :composition
      t.string :electrolyte
      t.string :application
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
