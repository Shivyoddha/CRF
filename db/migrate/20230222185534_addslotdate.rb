class Addslotdate < ActiveRecord::Migration[6.1]
  def change
    add_column :xrds, :slottime, :time
    add_column :xrds, :slotdate, :date
  end
end
