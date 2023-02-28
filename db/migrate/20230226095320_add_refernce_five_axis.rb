class AddRefernceFiveAxis < ActiveRecord::Migration[6.1]
  def change
    add_reference :five_axis, :user, foreign_key: true
  end
end
