class AddAmountToTab < ActiveRecord::Migration[6.1]
  def change
  add_column:advance_molecular_rheometers, :amount, :float
  add_column:atomic_force_microscopes, :amount, :float
  add_column:ball_mailings, :amount, :float
  add_column:bets, :amount, :float
  add_column:cell_imagings, :amount, :float
  add_column:electro_chemicals, :amount, :float
  add_column:equiplists, :amount, :float
  add_column:five_axis, :amount, :float
  add_column:frictions, :amount, :float
  add_column:gaits, :amount, :float
  add_column:gas_sensings, :amount, :float
  add_column:glove_boxes, :amount, :float
  add_column:glows, :amount, :float
  add_column:grindings, :amount, :float
  add_column:high_temp_vaccums, :amount, :float
  add_column:hr_fesem_cs, :amount, :float
  add_column:hr_fesem_js, :amount, :float
  add_column:hrlcms, :amount, :float
  add_column:icp_ms, :amount, :float
  add_column:impedance_analies, :amount, :float
  add_column:integrated_multi_role_testers, :amount, :float
  add_column:ion_chromotographies, :amount, :float
  add_column:lasers, :amount, :float
  add_column:low_fatigues, :amount, :float
  add_column:micro_edms, :amount, :float
  add_column:milli_qs, :amount, :float
  add_column:multi_impact_testers, :amount, :float
  add_column:probe_sonicators, :amount, :float
  add_column:raman_microscopes, :amount, :float
  add_column:scratch_indentations, :amount, :float
  add_column:spark_os, :amount, :float
  add_column:spectro_radio_meters, :amount, :float
  add_column:tga_fttrs, :amount, :float
  add_column:three_d_non_contacts, :amount, :float
  add_column:three_d_scanners, :amount, :float
  add_column:tribometers, :amount, :float
  add_column:ultra_centrifuges, :amount, :float
  add_column:uv_vis_nirs, :amount, :float
  add_column:zeta_potential_sizes, :amount, :float

  end
end
