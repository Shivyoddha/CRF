class CreateAtomicForceMicroscopes < ActiveRecord::Migration[6.1]
  def change
    create_table :atomic_force_microscopes do |t|
      t.string :sample
      t.string :stype
      t.string :technique
      t.string :scan_rate
      t.string :x
      t.string :y
      t.string :description
      t.string :toxicity
      t.string :compatability
      t.string :carcinogenic
      t.string :more

      t.timestamps
    end
  end
end
