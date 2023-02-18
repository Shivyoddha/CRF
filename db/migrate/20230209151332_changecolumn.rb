class Changecolumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :context
  end
end
