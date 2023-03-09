class AddAddressRefToXrd < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :xrd, foreign_key: true
  end
end
