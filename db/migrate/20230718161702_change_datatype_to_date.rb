class ChangeDatatypeToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :activities, :start_date, :date
    change_column :activities, :end_date, :date
  end
end
