class CreateAutomaticMultiSpecimenPolishers < ActiveRecord::Migration[7.0]
  def change
    create_table :automatic_multi_specimen_polishers do |t|
      t.string :name

      t.timestamps
    end
  end
end
