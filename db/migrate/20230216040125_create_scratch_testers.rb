class CreateScratchTesters < ActiveRecord::Migration[7.0]
  def change
    create_table :scratch_testers do |t|
      t.string :name

      t.timestamps
    end
  end
end
