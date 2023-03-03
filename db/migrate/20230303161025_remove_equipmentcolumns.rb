class RemoveEquipmentcolumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :equipment, :feature
    remove_column :equipment, :resolution
    remove_column :equipment, :application
    remove_column :equipment, :facilities
  end
end
