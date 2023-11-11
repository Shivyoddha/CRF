class RenameTypeColumnInActivities < ActiveRecord::Migration[6.1]
  def change
    rename_column :activities, :type, :activity_type
  end
end
