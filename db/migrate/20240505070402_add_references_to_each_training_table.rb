class AddReferencesToEachTrainingTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :training1s, :training_list, foreign_key: true
    add_reference :training2s, :training_list, foreign_key: true
    add_reference :training3s, :training_list, foreign_key: true
    add_reference :training4s, :training_list, foreign_key: true
  end
end
