class CreateLasers < ActiveRecord::Migration[6.1]
  def change
    create_table :lasers do |t|
      t.integer :sample
      t.string :composition
      t.string :stype
      t.string :temp_points
      t.string :toxicity
      t.string :compatibility
      t.string :more
      t.string :debit
      t.string :slotdate
      t.string :slottime
      t.string :status

      t.timestamps
    end
  end
end
