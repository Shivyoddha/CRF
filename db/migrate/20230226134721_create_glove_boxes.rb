class CreateGloveBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :glove_boxes do |t|
      t.float :weight
      t.integer :days
      t.string :toxicity
      t.string :carcinogenic
      t.string :incompatible
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
