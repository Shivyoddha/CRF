class AddEntryTypeToTab < ActiveRecord::Migration[6.1]
  def change
      add_column:advance_molecular_rheometers, :entry_type, :string
      add_column:atomic_force_microscopes, :entry_type, :string
      add_column:ball_mailings, :entry_type, :string
      add_column:bets, :entry_type, :string
      add_column:cell_imagings, :entry_type, :string
      add_column:electro_chemicals, :entry_type, :string
      add_column:equiplists, :entry_type, :string
      add_column:five_axis, :entry_type, :string
      add_column:frictions, :entry_type, :string
      add_column:gaits, :entry_type, :string
      add_column:gas_sensings, :entry_type, :string
      add_column:glove_boxes, :entry_type, :string
      add_column:glows, :entry_type, :string
      add_column:grindings, :entry_type, :string
      add_column:high_temp_vaccums, :entry_type, :string
      add_column:hr_fesem_cs, :entry_type, :string
      add_column:hr_fesem_js, :entry_type, :string
      add_column:hrlcms, :entry_type, :string
      add_column:icp_ms, :entry_type, :string
      add_column:impedance_analies, :entry_type, :string
      add_column:integrated_multi_role_testers, :entry_type, :string
      add_column:ion_chromotographies, :entry_type, :string
      add_column:lasers, :entry_type, :string
      add_column:liquid_nitrogens, :entry_type, :string
      add_column:low_fatigues, :entry_type, :string
      add_column:micro_edms, :entry_type, :string
      add_column:milli_qs, :entry_type, :string
      add_column:multi_impact_testers, :entry_type, :string
      add_column:probe_sonicators, :entry_type, :string
      add_column:raman_microscopes, :entry_type, :string
      add_column:scratch_indentations, :entry_type, :string
      add_column:spark_os, :entry_type, :string
      add_column:spectro_radio_meters, :entry_type, :string
      add_column:tga_fttrs, :entry_type, :string
      add_column:three_d_non_contacts, :entry_type, :string
      add_column:three_d_scanners, :entry_type, :string
      add_column:tribometers, :entry_type, :string
      add_column:ultra_centrifuges, :entry_type, :string
      add_column:uv_vis_nirs, :entry_type, :string
      add_column:zeta_potential_sizes, :entry_type, :string
  end
end
