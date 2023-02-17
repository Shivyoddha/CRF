class CreateXrds < ActiveRecord::Migration[7.0]
  def change
    create_table :xrds do |t|
      t.string :sample
      t.string :measurement
      t.string :composition
      t.string :stype
      t.string :mind
      t.string :maxd
      t.binary :reference
      t.string :more

      t.timestamps
    end
  end
end
