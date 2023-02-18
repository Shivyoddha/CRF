class CreateZetaPotentialSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :zeta_potential_sizes do |t|
      t.string :sample
      t.string :type
      t.string :toxicity
      t.string :element
      t.string :solvent
      t.string :refractive_index
      t.string :viscosity
      t.string :solute
      t.string :angle
      t.string :analysis_type
      t.string :analysis_temperature
      t.string :more

      t.timestamps
    end
  end
end
