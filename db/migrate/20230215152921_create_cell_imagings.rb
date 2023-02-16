class CreateCellImagings < ActiveRecord::Migration[7.0]
  def change
    create_table :cell_imagings do |t|
      t.string :name

      t.timestamps
    end
  end
end
