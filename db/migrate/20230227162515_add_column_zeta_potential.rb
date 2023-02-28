class AddColumnZetaPotential < ActiveRecord::Migration[6.1]
  def change
    add_column :zeta_potential_sizes, :status, :string
    add_column :zeta_potential_sizes, :slottime, :time
    add_column :zeta_potential_sizes, :slotdate, :date
    add_column :zeta_potential_sizes, :debit, :string
    change_column(:zeta_potential_sizes,:sample,:integer)
    add_column :zeta_potential_sizes, :stype, :string
    remove_column :zeta_potential_sizes,:type
    add_column :zeta_potential_sizes, :viscositypoise, :float
    add_column :zeta_potential_sizes, :viscositytemp, :float
    add_column :zeta_potential_sizes, :soluteknown, :string
    add_column :zeta_potential_sizes, :solutename, :string
    add_column :zeta_potential_sizes, :refindex, :float
    remove_column :zeta_potential_sizes, :viscosity
    remove_column :zeta_potential_sizes, :solute
  end
end
