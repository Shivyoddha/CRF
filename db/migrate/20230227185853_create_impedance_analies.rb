class CreateImpedanceAnalies < ActiveRecord::Migration[6.1]
  def change
    create_table :impedance_analies do |t|
      t.integer :sample
      t.string :composition
      t.string :capacitance
      t.string :dielectric
      t.string :iv
      t.float :freqrange
      t.float :currentrange
      t.float :voltagerange
      t.string :impedance
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
