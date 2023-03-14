class AddRefernceFtnmr < ActiveRecord::Migration[6.1]
  def change
    add_reference :ft_nms, :user, foreign_key: true
  end
end
