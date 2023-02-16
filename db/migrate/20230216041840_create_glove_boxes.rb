class CreateGloveBoxes < ActiveRecord::Migration[7.0]
  def change
    create_table :glove_boxes do |t|
      t.string :name

      t.timestamps
    end
  end
end
