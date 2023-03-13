class AddReferenceToTheEquipment < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :probe_sonicator, foreign_key: true
    add_reference :equipment_tables, :raman_microscope, foreign_key: true
    add_reference :equipment_tables, :scratch_indentation, foreign_key: true
    add_reference :equipment_tables, :three_d_scanner, foreign_key: true
    add_reference :equipment_tables, :spark_o, foreign_key: true
    add_reference :equipment_tables, :spectro_radio_meter, foreign_key: true
    add_reference :equipment_tables, :tribometer, foreign_key: true
    add_reference :equipment_tables, :ultra_centrifuge, foreign_key: true
    add_reference :equipment_tables, :uv_vis_nir, foreign_key: true
    add_reference :equipment_tables, :zeta_potential_size, foreign_key: true
  end
end
