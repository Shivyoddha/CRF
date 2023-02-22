class Addstatustoxrd < ActiveRecord::Migration[6.1]
  def change
    add_column :xrds, :status, :string
  end
end
