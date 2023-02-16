class CreateThreeDScanners < ActiveRecord::Migration[7.0]
  def change
    create_table :three_d_scanners do |t|
      t.string :name

      t.timestamps
    end
  end
end
