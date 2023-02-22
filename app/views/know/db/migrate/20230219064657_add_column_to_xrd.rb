class AddColumnToXrd < ActiveRecord::Migration[6.1]
  def change
    add_column :xrds, :debit, :string
  end
end
