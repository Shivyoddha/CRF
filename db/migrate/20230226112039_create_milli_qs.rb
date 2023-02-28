class CreateMilliQs < ActiveRecord::Migration[6.1]
  def change
    create_table :milli_qs do |t|
      t.string :typewater
      t.float :volumeone
      t.float :volumetwo
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
