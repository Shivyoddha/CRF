class Changecolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :context
  end
end
