class CreateAtomicForceMicroscopes < ActiveRecord::Migration[7.0]
  def change
    create_table :atomic_force_microscopes do |t|
      t.string :name

      t.timestamps
    end
  end
end
