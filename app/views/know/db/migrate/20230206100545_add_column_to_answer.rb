class AddColumnToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :context, :text
  end
end
