class CreateSpectroRadioMeters < ActiveRecord::Migration[6.1]
  def change
    create_table :spectro_radio_meters do |t|
      t.integer :sample
      t.string :nature
      t.string :application
      t.string :stype
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
