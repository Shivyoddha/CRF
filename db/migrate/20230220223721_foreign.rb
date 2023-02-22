class Foreign < ActiveRecord::Migration[6.1]
  def change
    add_reference :xrds, :user, foreign_key: true
  end
end
