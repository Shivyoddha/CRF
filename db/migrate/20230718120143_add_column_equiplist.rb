class AddColumnEquiplist < ActiveRecord::Migration[6.1]
  def change
    change_column :equiplists,:calibrate, :string
    add_column :equiplists,:calibrate_date,:datetime
  end
end
