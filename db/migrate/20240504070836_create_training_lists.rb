class CreateTrainingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :training_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
