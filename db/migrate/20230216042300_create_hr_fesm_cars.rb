class CreateHrFesmCars < ActiveRecord::Migration[7.0]
  def change
    create_table :hr_fesm_cars do |t|
      t.string :name

      t.timestamps
    end
  end
end
