class AddRefernceLaser < ActiveRecord::Migration[6.1]
  def change
    add_reference :lasers, :user, foreign_key: true
  end
end
