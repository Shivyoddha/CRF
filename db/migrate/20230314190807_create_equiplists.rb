class CreateEquiplists < ActiveRecord::Migration[6.1]
  def change
    create_table :equiplists do |t|
      t.string :name
      t.string :status
      t.date :calibrate

      t.timestamps
    end
  end
end
