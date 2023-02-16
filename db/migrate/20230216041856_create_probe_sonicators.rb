class CreateProbeSonicators < ActiveRecord::Migration[7.0]
  def change
    create_table :probe_sonicators do |t|
      t.string :name

      t.timestamps
    end
  end
end
