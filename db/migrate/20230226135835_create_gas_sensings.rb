class CreateGasSensings < ActiveRecord::Migration[6.1]
  def change
    create_table :gas_sensings do |t|
      t.integer :sample
      t.string :gas
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
