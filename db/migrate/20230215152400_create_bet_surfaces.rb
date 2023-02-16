class CreateBetSurfaces < ActiveRecord::Migration[7.0]
  def change
    create_table :bet_surfaces do |t|
      t.string :name

      t.timestamps
    end
  end
end
