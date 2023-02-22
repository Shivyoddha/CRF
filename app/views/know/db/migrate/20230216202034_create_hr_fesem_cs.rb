class CreateHrFesemCs < ActiveRecord::Migration[6.1]
  def change
    create_table :hr_fesem_cs do |t|
      t.string :sample
      t.string :composition
      t.string :stype
      t.string :sphase
      t.string :measurement
      t.string :eds_required
      t.string :toxic
      t.string :conducting
      t.string :more

      t.timestamps
    end
  end
end
