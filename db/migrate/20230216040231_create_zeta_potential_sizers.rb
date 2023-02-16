class CreateZetaPotentialSizers < ActiveRecord::Migration[7.0]
  def change
    create_table :zeta_potential_sizers do |t|
      t.string :name

      t.timestamps
    end
  end
end
