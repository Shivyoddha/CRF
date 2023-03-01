class CreateMultiImpactTesters < ActiveRecord::Migration[6.1]
  def change
    create_table :multi_impact_testers do |t|
      t.integer :sample
      t.string :stype
      t.integer :size
      t.string :measuerment
      t.float :drop_range
      t.float :drop_velocity
      t.float :drop_temp
      t.string :drop_shape
      t.float :shpb_lenght
      t.float :shpb_temp
      t.float :bullet_velocity
      t.float :bullet_shape
      t.float :bird_velocity
      t.string :bird_shape
      t.string :more
      t.string :status
      t.date :slotdate
      t.time :slottime
      t.string :debit

      t.timestamps
    end
  end
end
