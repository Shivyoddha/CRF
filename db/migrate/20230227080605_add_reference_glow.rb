class AddReferenceGlow < ActiveRecord::Migration[6.1]
  def change
    add_reference :glows, :user, foreign_key: true
  end
end
