class AddColumnZeta < ActiveRecord::Migration[6.1]
  def change
    add_column :zeta_potential_sizes, :abscoefficent, :string
  end
end
