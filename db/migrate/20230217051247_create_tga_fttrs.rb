class CreateTgaFttrs < ActiveRecord::Migration[6.1]
  def change
    create_table :tga_fttrs do |t|
      t.string :sample
      t.string :measurement
      t.string :stype
      t.string :description
      t.string :nature
      t.string :min_temp
      t.string :max_temp
      t.string :scan_rate
      t.string :atmosphere
      t.string :hazard
      t.string :compatability
      t.string :carcinogenic
      t.string :explosive
      t.string :more

      t.timestamps
    end
  end
end
