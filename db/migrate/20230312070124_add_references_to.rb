class AddReferencesTo < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :five_axi, foreign_key: true
    add_reference :equipment_tables, :friction, foreign_key: true
    add_reference :equipment_tables, :gait, foreign_key: true
    add_reference :equipment_tables, :gas_sensing, foreign_key: true
    add_reference :equipment_tables, :glove_box, foreign_key: true
    add_reference :equipment_tables, :glow, foreign_key: true
    add_reference :equipment_tables, :grinding, foreign_key: true
    add_reference :equipment_tables, :high_temp_vaccum, foreign_key: true
    add_reference :equipment_tables, :hrlcm, foreign_key: true
    add_reference :equipment_tables, :icp_m, foreign_key: true
    add_reference :equipment_tables, :impedance_analy, foreign_key: true
    add_reference :equipment_tables, :laser, foreign_key: true
    add_reference :equipment_tables, :liquid_nitrogen, foreign_key: true
    add_reference :equipment_tables, :low_fatigue, foreign_key: true
    add_reference :equipment_tables, :milli_q, foreign_key: true
    add_reference :equipment_tables, :micro_edm, foreign_key: true
    add_reference :equipment_tables, :multi_impact_tester, foreign_key: true

  end
end
