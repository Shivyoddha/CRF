class CreateSpectroRadiometers < ActiveRecord::Migration[7.0]
  def change
    create_table :spectro_radiometers do |t|
      t.string :name

      t.timestamps
    end
  end
end
