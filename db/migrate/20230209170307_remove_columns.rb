class RemoveColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :contents, :content
    remove_column :briefs, :brief
    add_column :contents, :name, :string
    add_column :briefs, :name, :string
  end
end
