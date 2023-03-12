class AddColumnAmountNitrogen < ActiveRecord::Migration[6.1]
  def change
    add_column :liquid_nitrogens, :amount, :float
  end
end
