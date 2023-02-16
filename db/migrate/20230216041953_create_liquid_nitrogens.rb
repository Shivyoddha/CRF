class CreateLiquidNitrogens < ActiveRecord::Migration[7.0]
  def change
    create_table :liquid_nitrogens do |t|
      t.string :name

      t.timestamps
    end
  end
end
