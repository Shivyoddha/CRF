class CreateImpedanceAnalyzers < ActiveRecord::Migration[7.0]
  def change
    create_table :impedance_analyzers do |t|
      t.string :name

      t.timestamps
    end
  end
end
