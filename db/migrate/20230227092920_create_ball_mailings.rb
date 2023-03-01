class CreateBallMailings < ActiveRecord::Migration[6.1]
  def change
    create_table :ball_mailings do |t|
      t.integer :sample
      t.string :feed
      t.string :btype
      t.string :grind
      t.string :specify
      t.float :size
      t.float :grinding
      t.float :speed
      t.string :hardness
      t.string :toxicity
      t.string :compatibility
      t.string :more
      t.string :status
      t.date :slotdate
      t.time :slottime
      t.string :debit

      t.timestamps
    end
  end
end
