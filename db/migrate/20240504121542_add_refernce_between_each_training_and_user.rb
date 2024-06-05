class AddRefernceBetweenEachTrainingAndUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :training1s, :user, foreign_key: true
    add_reference :training2s, :user, foreign_key: true
    add_reference :training3s, :user, foreign_key: true
    add_reference :training4s, :user, foreign_key: true
  end
end
