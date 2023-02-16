class CreateXRayDiffractions < ActiveRecord::Migration[7.0]
  def change
    create_table :x_ray_diffractions do |t|
      t.string :name

      t.timestamps
    end
  end
end
