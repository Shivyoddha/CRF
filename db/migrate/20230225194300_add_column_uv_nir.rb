class AddColumnUvNir < ActiveRecord::Migration[6.1]
  def change
    add_column :uv_vis_nirs, :measurement, :string
  end
end
