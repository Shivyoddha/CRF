class AddForiegnKeyToTitle < ActiveRecord::Migration[6.1]
  def change
    add_reference :titles, :equipment, foreign_key: true
  end
end
