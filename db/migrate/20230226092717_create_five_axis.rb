class CreateFiveAxis < ActiveRecord::Migration[6.1]
  def change
    create_table :five_axis do |t|
      t.integer :sample
      t.string :material
      t.string :depth
      t.string :operation
      t.string :tool
      t.string :specimentolerance
      t.string :cncprogram
      t.string :rotationalspeed
      t.string :feedrate
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
