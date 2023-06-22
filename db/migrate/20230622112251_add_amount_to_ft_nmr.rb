class AddAmountToFtNmr < ActiveRecord::Migration[6.1]
  def change
    add_column:ft_nms, :amount, :float
  end
end
