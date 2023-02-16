class CreateGasSensings < ActiveRecord::Migration[7.0]
  def change
    create_table :gas_sensings do |t|
      t.string :name

      t.timestamps
    end
  end
end
