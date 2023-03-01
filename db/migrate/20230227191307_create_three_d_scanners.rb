class CreateThreeDScanners < ActiveRecord::Migration[6.1]
  def change
    create_table :three_d_scanners do |t|
      t.integer :sample
      t.integer :size
      t.string :texture
      t.string :ply
      t.string :stt
      t.string :wrl
      t.string :obj
      t.string :asc
      t.string :aop
      t.string :ptx
      t.string :xyzrgb
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
