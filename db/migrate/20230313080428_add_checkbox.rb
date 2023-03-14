class AddCheckbox < ActiveRecord::Migration[6.1]
  def change
    remove_column:uv_vis_nirs,:measurement
    add_column :uv_vis_nirs, :measurement, :text, default: [].to_yaml
    remove_column:uv_vis_nirs,:absorbance
    remove_column:uv_vis_nirs,:reflectance
    remove_column:uv_vis_nirs,:transmittance
    remove_column:hrlcms,:health
    remove_column:hrlcms,:testing_required
    add_column :uv_vis_nirs, :testing_required, :text, default: [].to_yaml
    add_column :uv_vis_nirs, :health, :text, default: [].to_yaml
    remove_column:ft_nms,:measurement1
    remove_column:ft_nms,:measurement2
    remove_column:ft_nms,:measurement3
    remove_column:ft_nms,:measurement4
    remove_column:ft_nms,:measurement5
    add_column :uv_vis_nirs, :measurement1, :text, default: [].to_yaml
    add_column :uv_vis_nirs, :measurement2, :text, default: [].to_yaml
    add_column :uv_vis_nirs, :measurement3, :text, default: [].to_yaml
    add_column :uv_vis_nirs, :measurement4, :text, default: [].to_yaml
    add_column :uv_vis_nirs, :measurement5, :text, default: [].to_yaml
    remove_column:ft_nms,:hazardmethod
    add_column :uv_vis_nirs, :hazardmethod, :text, default: [].to_yaml
    remove_column:impedance_analies,:capacitance
    remove_column:impedance_analies,:dielectric
    remove_column:impedance_analies,:iv
    remove_column:impedance_analies,:impedance
    add_column :impedance_analies, :measurement, :text, default: [].to_yaml
    remove_column:three_d_scanners,:ply
    remove_column:three_d_scanners,:stt
    remove_column:three_d_scanners,:wrl
    remove_column:three_d_scanners,:obj
    remove_column:three_d_scanners,:asc
    remove_column:three_d_scanners,:aop
    remove_column:three_d_scanners,:ptx
    remove_column:three_d_scanners,:xyzrgb
    add_column :three_d_scanners, :output_format, :text, default: [].to_yaml
    remove_column:gaits,:output_format
    add_column :gaits, :output_format, :text, default: [].to_yaml
    add_column :micro_edms, :measuerment, :text, default: [].to_yaml
    remove_column:frictions,:material
    add_column :frictions, :material, :text, default: [].to_yaml
    remove_column:grindings,:grit
    remove_column:grindings,:diamond
    remove_column:grindings,:suspension
    add_column:grindings,:grit, :text, default: [].to_yaml
    add_column:grindings,:diamond, :text, default: [].to_yaml
    add_column:grindings,:suspension, :text, default: [].to_yaml
  end
end
