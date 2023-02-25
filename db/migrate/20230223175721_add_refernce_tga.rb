class AddRefernceTga < ActiveRecord::Migration[6.1]
  def change
    add_reference :tga_fttrs, :user, foreign_key: true
  end
end
