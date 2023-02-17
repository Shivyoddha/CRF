class CreateHrlcms < ActiveRecord::Migration[7.0]
  def change
    create_table :hrlcms do |t|
      t.string :sample
      t.string :nature_sample
      t.string :category
      t.string :sample_type
      t.string :solvent
      t.string :analysis
      t.string :sample_volume
      t.string :sample_concentration
      t.string :sample_salts
      t.string :sample_contains
      t.string :storage
      t.string :testing_required
      t.string :incompatible
      t.string :toxicity
      t.string :disposal
      t.string :health
      t.string :more

      t.timestamps
    end
  end
end
