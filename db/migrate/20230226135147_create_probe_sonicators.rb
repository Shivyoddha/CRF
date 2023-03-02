class CreateProbeSonicators < ActiveRecord::Migration[6.1]
  def change
    create_table :probe_sonicators do |t|
      t.integer :sample
      t.float :size
      t.float :amplitude
      t.float :volume
      t.float :viscosity
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
