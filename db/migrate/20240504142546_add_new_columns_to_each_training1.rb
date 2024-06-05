class AddNewColumnsToEachTraining1 < ActiveRecord::Migration[6.1]
  def change
      add_column :training1s, :slottime, :time
      add_column :training2s, :slottime, :time
      add_column :training3s, :slottime, :time
      add_column :training4s, :slottime, :time
      add_column :training1s, :slotdate, :date
      add_column :training2s, :slotdate, :date
      add_column :training3s, :slotdate, :date
      add_column :training4s, :slotdate, :date
  end
end
