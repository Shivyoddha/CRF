class AddForiegnKeyToTitle < ActiveRecord::Migration[7.0]
  def change
    add_reference :titles, :equipment, foreign_key: true
  end
end
