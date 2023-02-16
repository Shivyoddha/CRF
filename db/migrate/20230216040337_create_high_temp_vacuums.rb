class CreateHighTempVacuums < ActiveRecord::Migration[7.0]
  def change
    create_table :high_temp_vacuums do |t|
      t.string :name

      t.timestamps
    end
  end
end
