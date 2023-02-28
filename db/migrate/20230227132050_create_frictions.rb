class CreateFrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :frictions do |t|
      t.integer :sample
      t.string :material
      t.string :pstype
      t.string :tool
      t.string :toolnom
      t.float :rspeed
      t.float :wspeed
      t.float :otforce
      t.float :wtforce
      t.string :measurement
      t.float :depth
      t.float :ptforce
      t.string :more
      t.string :status
      t.date :slotdate
      t.time :slottime
      t.string :debit

      t.timestamps
    end
  end
end
