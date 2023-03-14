class AddColumnHrLcms < ActiveRecord::Migration[6.1]
  def change
    remove_column :hrlcms,:health
    add_column :hrlcms,:health,:string
  end
end
