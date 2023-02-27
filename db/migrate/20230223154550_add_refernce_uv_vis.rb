class AddRefernceUvVis < ActiveRecord::Migration[6.1]
  def change
    add_reference :uv_vis_nirs, :user, foreign_key: true
  end
end
