class CreateUltraCentrifuges < ActiveRecord::Migration[7.0]
  def change
    create_table :ultra_centrifuges do |t|
      t.string :name

      t.timestamps
    end
  end
end
