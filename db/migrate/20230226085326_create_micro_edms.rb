class CreateMicroEdms < ActiveRecord::Migration[6.1]
  def change
    create_table :micro_edms do |t|
      t.integer :sample
      t.string :composition
      t.string :toolelectrode
      t.string :toolmaterial
      t.string :milling
      t.string :turning
      t.string :drilling
      t.string :edm
      t.string :edg
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
