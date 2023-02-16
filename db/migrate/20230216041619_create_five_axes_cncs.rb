class CreateFiveAxesCncs < ActiveRecord::Migration[7.0]
  def change
    create_table :five_axes_cncs do |t|
      t.string :name

      t.timestamps
    end
  end
end
