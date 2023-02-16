class CreateLowForceFatigues < ActiveRecord::Migration[7.0]
  def change
    create_table :low_force_fatigues do |t|
      t.string :name

      t.timestamps
    end
  end
end
