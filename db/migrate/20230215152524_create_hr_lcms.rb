class CreateHrLcms < ActiveRecord::Migration[7.0]
  def change
    create_table :hr_lcms do |t|
      t.string :name

      t.timestamps
    end
  end
end
