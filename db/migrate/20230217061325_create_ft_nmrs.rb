class CreateFtNmrs < ActiveRecord::Migration[6.1]
  def change
    create_table :ft_nmrs do |t|
      t.string :sample
      t.string :sample_nature
      t.string :sample_phase
      t.string :toxicity
      t.string :health
      t.string :storage
      t.string :more

      t.timestamps
    end
  end
end
