class CreateAdvanceModularRheometers < ActiveRecord::Migration[7.0]
  def change
    create_table :advance_modular_rheometers do |t|
      t.string :name

      t.timestamps
    end
  end
end
