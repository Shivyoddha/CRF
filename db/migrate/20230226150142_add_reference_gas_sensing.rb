class AddReferenceGasSensing < ActiveRecord::Migration[6.1]
  def change
    add_reference :gas_sensings, :user, foreign_key: true
  end
end
