class AddcolumnMilli < ActiveRecord::Migration[6.1]
  def change
      add_column :milli_qs, :amounttotal, :float
  end
end
