class AddReferenceToBall < ActiveRecord::Migration[6.1]
  def change
      add_reference :ball_mailings, :user, foreign_key: true
  end
end
