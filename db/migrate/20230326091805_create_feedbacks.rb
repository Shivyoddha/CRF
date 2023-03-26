class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :username
      t.string :email
      t.text :feedback
      t.date :date

      t.timestamps
    end
  end
end
