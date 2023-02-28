class CreateLowFatigues < ActiveRecord::Migration[6.1]
  def change
    create_table :low_fatigues do |t|
      t.integer :sample
      t.string :sc1
      t.string :st1
      t.string :tt1
      t.string :tf1
      t.string :sc2
      t.string :st2
      t.string :tt2
      t.string :tf2
      t.string :sc3
      t.string :st3
      t.string :tt3
      t.string :tf3
      t.string :sc4
      t.string :st4
      t.string :tt4
      t.string :tf4
      t.string :sc5
      t.string :st5
      t.string :tt5
      t.string :tf5
      t.string :more
      t.time :slottime
      t.date :slotdate
      t.string :status
      t.string :debit
      t.string :m1
      t.string :m2
      t.string :m3
      t.string :m4
      t.string :m5

      t.timestamps
    end
  end
end
