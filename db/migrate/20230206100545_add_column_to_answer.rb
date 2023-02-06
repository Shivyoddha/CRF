class AddColumnToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :context, :text
  end
end
