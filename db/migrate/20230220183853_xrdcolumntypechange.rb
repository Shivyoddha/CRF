class Xrdcolumntypechange < ActiveRecord::Migration[6.1]
  def change
    change_column(:xrds, :sample, :integer)
  end
end
