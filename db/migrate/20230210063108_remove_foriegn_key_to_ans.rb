class RemoveForiegnKeyToAns < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :slots, :users
  end
end
