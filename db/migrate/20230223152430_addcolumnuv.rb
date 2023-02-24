class Addcolumnuv < ActiveRecord::Migration[6.1]
  def change
    add_column:uv_vis_nirs,:status ,:string
    add_column:uv_vis_nirs,:slotdate ,:date
    add_column:uv_vis_nirs,:slottime ,:time
    add_column:uv_vis_nirs,:debit ,:string
    add_column:uv_vis_nirs,:transmittance ,:string



    add_column:uv_vis_nirs,:absorbance  ,:string
    add_column:uv_vis_nirs,:reflectance ,:string
    add_column:uv_vis_nirs,:measurement ,:string
  end
end
