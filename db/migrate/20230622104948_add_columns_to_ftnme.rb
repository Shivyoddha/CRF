class AddColumnsToFtnme < ActiveRecord::Migration[6.1]
  def change
    add_column:ft_nms, :entry_type, :string
    add_column:ft_nms, :dummy1, :string
    add_column:ft_nms, :dummy2, :string
    add_column:ft_nms, :dummy3, :string
  end
end
