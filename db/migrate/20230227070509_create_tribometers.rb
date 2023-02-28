class CreateTribometers < ActiveRecord::Migration[6.1]
  def change
    create_table :tribometers do |t|
      t.integer :sample
      t.string :measurement
      t.string :stype
      t.float :temp_req
      t.float :loading
      t.string :indenter
      t.float :stroke
      t.string :more

      t.timestamps
    end
  end
end
