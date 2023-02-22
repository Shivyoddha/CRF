class AddForiegnKeyToContent < ActiveRecord::Migration[6.1]
  def change
    add_reference :contents, :equipment, foreign_key: true
    add_reference :contents, :title, foreign_key: true
  end
end
