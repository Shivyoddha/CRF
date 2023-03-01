class AddRefernceHighTemp < ActiveRecord::Migration[6.1]
  def change
    add_reference :high_temp_vaccums, :user, foreign_key: true
  end
end
