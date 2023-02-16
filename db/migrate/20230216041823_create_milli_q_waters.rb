class CreateMilliQWaters < ActiveRecord::Migration[7.0]
  def change
    create_table :milli_q_waters do |t|
      t.string :name

      t.timestamps
    end
  end
end
