class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :type
      t.date :start_date
      t.date :end_date
      t.integer :no_of_attendees
      t.text :name_and_guide

      t.timestamps
    end
  end
end
