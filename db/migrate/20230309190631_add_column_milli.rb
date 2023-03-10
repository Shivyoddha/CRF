class AddColumnMilli < ActiveRecord::Migration[6.1]
  def change
      add_column :milli_qs, :amount1, :float
      add_column :milli_qs, :amount2, :float
  end
end
