class CreateElectroChemicalPolishings < ActiveRecord::Migration[7.0]
  def change
    create_table :electro_chemical_polishings do |t|
      t.string :name

      t.timestamps
    end
  end
end
