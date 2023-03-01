class CreateGaits < ActiveRecord::Migration[6.1]
  def change
    create_table :gaits do |t|
      t.string :subject
      t.string :measurement
      t.integer :trials
      t.string  :output_format
      t.string  :force_plate
      t.string :clinical_trial
      t.string :physician
      t.string :more
      t.string :status
      t.date :slotdate
      t.time :slottime
      t.string :debit

      t.timestamps
    end
  end
end
