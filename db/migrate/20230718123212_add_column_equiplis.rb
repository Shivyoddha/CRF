class AddColumnEquiplis < ActiveRecord::Migration[6.1]
  def change
      add_column :equiplists,:status_date,:datetime
  end
end
