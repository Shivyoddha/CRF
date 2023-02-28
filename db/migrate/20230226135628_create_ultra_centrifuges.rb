class CreateUltraCentrifuges < ActiveRecord::Migration[6.1]
  def change
    create_table :ultra_centrifuges do |t|
      t.integer :sample
      t.float :volume
      t.float :speed
      t.float :temperature
      t.string :toxicity
      t.string :compatibility
      t.string :carcinogenic
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
