class AddReferncecolumThreeD < ActiveRecord::Migration[6.1]
  def change
    add_reference :three_d_non_contacts, :user, foreign_key: true
  end
end
