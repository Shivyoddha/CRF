class Addcolumntypetoxrd < ActiveRecord::Migration[6.1]
  def change
    change_column(:xrds,:mind,:float)
    change_column(:xrds,:maxd,:float)
  end
end
