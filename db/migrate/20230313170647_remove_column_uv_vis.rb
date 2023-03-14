class RemoveColumnUvVis < ActiveRecord::Migration[6.1]
  def change
    remove_column :uv_vis_nirs, :measurement1
    remove_column :uv_vis_nirs, :measurement2
    remove_column :uv_vis_nirs, :measurement3
    remove_column :uv_vis_nirs, :measurement4
    remove_column :uv_vis_nirs, :measurement5
    remove_column :uv_vis_nirs, :hazardmethod
  end
end
