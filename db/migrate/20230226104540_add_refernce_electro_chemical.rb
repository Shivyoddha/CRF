class AddRefernceElectroChemical < ActiveRecord::Migration[6.1]
  def change
    add_reference :electro_chemicals, :user, foreign_key: true
  end
end
