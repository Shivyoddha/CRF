class AddColumnToBetSurface < ActiveRecord::Migration[7.0]
  def change
    add_column :bet_surfaces, :sample, :string
    add_column :bet_surfaces, :degassing, :string
    add_column :bet_surfaces, :analysis, :string
    add_column :bet_surfaces, :incompatible, :string
    add_column :bet_surfaces, :toxicity, :string
    add_column :bet_surfaces, :specific, :string
    add_column :bet_surfaces, :more, :string
  end
end
