class CreateGrindings < ActiveRecord::Migration[6.1]
  def change
    create_table :grindings do |t|
      t.integer :sample
      t.float :diameter
      t.string :mould
      t.string :grit
      t.string :diamond
      t.string :suspension
      t.string :lapping
      t.string :more
      t.string :status
      t.date :slotdate
      t.time :slottime
      t.string :debit

      t.timestamps
    end
  end
end
