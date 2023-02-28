class AddRefernceAtomi < ActiveRecord::Migration[6.1]
  def change
    add_reference :atomic_force_microscopes, :user, foreign_key: true
  end
end
