class CreateHighTempVaccums < ActiveRecord::Migration[6.1]
  def change
    create_table :high_temp_vaccums do |t|
      t.integer :sample
      t.string :composition
      t.string :toxicity
      t.string :req_atoms
      t.string :gas
      t.float :starttemp
      t.float :endtemp
      t.float :samplemelting
      t.string :no_steps
      t.float :temp1
      t.float :min1
      t.float :temp2
      t.float :min2
      t.float :temp3
      t.float :min3
      t.float :temp4
      t.float :min4
      t.float :temp5
      t.float :min5
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
