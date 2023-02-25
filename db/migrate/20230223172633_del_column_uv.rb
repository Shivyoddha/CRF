class DelColumnUv < ActiveRecord::Migration[6.1]
  def change
    remove_column:uv_vis_nirs,:measurement ,:string
  end
end
