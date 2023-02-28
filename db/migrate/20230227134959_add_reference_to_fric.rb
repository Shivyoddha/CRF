class AddReferenceToFric < ActiveRecord::Migration[6.1]
  def change
    add_reference :frictions, :user, foreign_key: true
  end
end
