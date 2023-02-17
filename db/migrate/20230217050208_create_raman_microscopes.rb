class CreateRamanMicroscopes < ActiveRecord::Migration[7.0]
  def change
    create_table :raman_microscopes do |t|
      t.string :sample
      t.string :measurement
      t.string :stype
      t.string :description
      t.string :toxicity
      t.string :Compatability
      t.string :carcinogenic
      t.string :more

      t.timestamps
    end
  end
end
