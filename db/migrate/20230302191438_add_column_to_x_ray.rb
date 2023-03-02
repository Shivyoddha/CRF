class AddColumnToXRay < ActiveRecord::Migration[6.1]
  def change
    add_column :xrds, :amount, :float
  end
end
