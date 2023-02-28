class CreateGlows < ActiveRecord::Migration[6.1]
  def change
    create_table :glows do |t|
      t.integer :sample
      t.string :elemental
      t.string :coated
      t.string :coated_ele
      t.string :substarte
      t.string :specification
      t.string :more
      t.string :status
      t.date :slotdate
      t.time :slottime
      t.string :debit

      t.timestamps
    end
  end
end
