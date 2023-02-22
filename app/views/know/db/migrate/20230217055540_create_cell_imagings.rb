class CreateCellImagings < ActiveRecord::Migration[6.1]
  def change
    create_table :cell_imagings do |t|
      t.string :sample
      t.string :stype
      t.string :plate
      t.string :expected_wavelenght
      t.string :assay_type
      t.string :detection
      t.string :image_filter
      t.string :image_mode
      t.string :toxicity
      t.string :compatibility
      t.string :hazard
      t.string :more

      t.timestamps
    end
  end
end
