class AddColumnImpded < ActiveRecord::Migration[6.1]
  def change
      add_column :impedance_analies, :losstangent, :string
  end
end
