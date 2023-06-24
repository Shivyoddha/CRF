class AddEntryTypeToTables < ActiveRecord::Migration[6.1]
  def change
    add_column:xrds, :entry_type, :string
  end
end
