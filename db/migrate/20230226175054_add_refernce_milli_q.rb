class AddRefernceMilliQ < ActiveRecord::Migration[6.1]
  def change
    add_reference :milli_qs, :user, foreign_key: true
  end
end
