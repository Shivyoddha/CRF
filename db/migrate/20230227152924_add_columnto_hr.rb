class AddColumntoHr < ActiveRecord::Migration[6.1]
  def change
      change_column(:hrlcms,:sample,:integer)
      change_column(:hrlcms,:sample_volume,:float)
  end
end
