class AddRefernceLiquidNitrogen < ActiveRecord::Migration[6.1]
  def change
    add_reference :liquid_nitrogens, :user, foreign_key: true
  end
end
