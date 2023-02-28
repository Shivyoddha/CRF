class AddRefernceImpdeance < ActiveRecord::Migration[6.1]
  def change
    add_reference :impedance_analies, :user, foreign_key: true
  end
end
