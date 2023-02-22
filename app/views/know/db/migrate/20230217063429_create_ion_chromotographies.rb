class CreateIonChromotographies < ActiveRecord::Migration[6.1]
  def change
    create_table :ion_chromotographies do |t|
      t.string :sample
      t.string :nature
      t.string :solvent
      t.string :volume
      t.string :concentration
      t.string :eluent
      t.string :analysis
      t.string :elements
      t.string :column
      t.string :flow_rate
      t.string :temperature
      t.string :detector
      t.string :toxicity
      t.string :hazards
      t.string :disposal
      t.string :more

      t.timestamps
    end
  end
end
