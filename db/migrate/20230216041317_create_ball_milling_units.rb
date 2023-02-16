class CreateBallMillingUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :ball_milling_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
