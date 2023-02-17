class CreateAdvanceMolecularRheometers < ActiveRecord::Migration[7.0]
  def change
    create_table :advance_molecular_rheometers do |t|
      t.string :sample
      t.string :type
      t.string :size
      t.string :nature
      t.string :temperature
      t.string :current
      t.string :shear_type
      t.string :shear_rate
      t.string :sweeps
      t.string :analysis
      t.string :toxicity
      t.string :more

      t.timestamps
    end
  end
end
