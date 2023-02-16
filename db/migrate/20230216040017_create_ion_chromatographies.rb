class CreateIonChromatographies < ActiveRecord::Migration[7.0]
  def change
    create_table :ion_chromatographies do |t|
      t.string :name

      t.timestamps
    end
  end
end
