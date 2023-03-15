class AddColumnFtNm < ActiveRecord::Migration[6.1]
  def change
    add_column:ft_nms,:hazardmethod  ,:string
    add_column:ft_nms,:temp ,:string
  end
end
