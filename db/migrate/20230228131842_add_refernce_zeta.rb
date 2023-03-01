class AddRefernceZeta < ActiveRecord::Migration[6.1]
  def change
    add_reference :zeta_potential_sizes, :user, foreign_key: true
  end
end
