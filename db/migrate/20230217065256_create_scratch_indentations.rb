class CreateScratchIndentations < ActiveRecord::Migration[7.0]
  def change
    create_table :scratch_indentations do |t|
      t.string :sample
      t.string :type
      t.string :measurement
      t.string :stroke
      t.string :number_indentation
      t.string :constant_load
      t.string :increment_load
      t.string :progressive_load
      t.string :temperature
      t.string :analysis
      t.string :more

      t.timestamps
    end
  end
end
