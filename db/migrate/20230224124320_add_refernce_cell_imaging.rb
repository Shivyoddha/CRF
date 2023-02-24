class AddRefernceCellImaging < ActiveRecord::Migration[6.1]
  def change
    add_reference :cell_imagings, :user, foreign_key: true
  end
end
