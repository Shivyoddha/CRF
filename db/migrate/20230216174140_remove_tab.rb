class RemoveTab < ActiveRecord::Migration[7.0]
  def change
    drop_table :zeta_potential_sizers
    drop_table :x_ray_diffractions
    drop_table :uv_vis_nirs
    drop_table :ultra_centrifuges
    drop_table :tribometers
    drop_table :three_d_scanners
    drop_table :tgaftirs
    drop_table :spectro_radiometers
    drop_table :spark_os
    drop_table :scratch_testers
    drop_table :raman_spectrometers
    drop_table :raman_spectrometer
    drop_table :probe_sonicators
    drop_table :multi_purpose_impacts
    drop_table :milli_q_waters
    drop_table :micro_edms
    drop_table :low_force_fatigues
    drop_table :liquid_nitrogens
    drop_table :laser_flash_analysers
    drop_table :intergrated_multi_roles
    drop_table :impedance_analyzers
    drop_table :icp_ms
    drop_table :hr_lcms
    drop_table :hr_fesm_cars
    drop_table :hr_fese_jeols
    drop_table :high_temp_vacuums
    drop_table :glow_discharges_os
    drop_table :glove_boxes
    drop_table :gas_sensings
    drop_table :gait_analyses
    drop_table :ft_nmrs
    drop_table :friction_stir_weldings
    drop_table :five_axes_cncs
    drop_table :electro_chemical_polishings
    drop_table :cell_imagings
    drop_table :bet_surfaces
    drop_table :ball_milling_units
    drop_table :automatic_multi_specimen_polishers
    drop_table :atomic_force_microscopes
    drop_table :ansys_system_labs
    drop_table :advance_modular_rheometers


  end
end
