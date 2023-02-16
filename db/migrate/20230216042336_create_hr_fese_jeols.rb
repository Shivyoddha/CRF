class CreateHrFeseJeols < ActiveRecord::Migration[7.0]
  def change
    create_table :hr_fese_jeols do |t|
      t.string :name

      t.timestamps
    end
  end
end
