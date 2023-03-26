class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
   
    create_table :announcements do |t|
      t.text :text
      t.datetime :created_on

      t.timestamps
    end
  end
end
