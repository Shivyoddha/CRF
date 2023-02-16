class CreateFrictionStirWeldings < ActiveRecord::Migration[7.0]
  def change
    create_table :friction_stir_weldings do |t|
      t.string :name

      t.timestamps
    end
  end
end
