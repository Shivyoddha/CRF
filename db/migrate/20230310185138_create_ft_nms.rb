class CreateFtNms < ActiveRecord::Migration[6.1]
  def change
    create_table :ft_nms do |t|
      t.integer :sample
      t.string :nature
      t.string :phase
      t.string :solvent1
      t.string :measurement1
      t.string :solvent2
      t.string :measurement2
      t.string :solvent3
      t.string :measurement3
      t.string :solvent4
      t.string :measurement4
      t.string :measurement5
      t.string :solvent5
      t.string :toxicity
      t.string :health
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
