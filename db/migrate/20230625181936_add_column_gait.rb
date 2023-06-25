class AddColumnGait < ActiveRecord::Migration[6.1]
  def change
    add_column :gaits,:slottype,:string
    add_column :gaits,:expresssample,:integer
    add_column :spectro_radio_meters,:slottype,:string
    add_column :spectro_radio_meters,:expresssample,:integer
    add_column :spark_os,:slottype,:string
    add_column :spark_os,:expresssample,:integer
    add_column :glows,:slottype,:string
    add_column :glows,:expresssample,:integer
    add_column :ball_mailings,:slottype,:string
    add_column :ball_mailings,:expresssample,:integer
    add_column :low_fatigues,:slottype,:string
    add_column :low_fatigues,:expresssample,:integer
    add_column :micro_edms,:slottype,:string
    add_column :micro_edms,:expresssample,:integer
    add_column :five_axis,:slottype,:string
    add_column :five_axis,:expresssample,:integer
    add_column :multi_impact_testers,:slottype,:string
    add_column :multi_impact_testers,:expresssample,:integer
    add_column :frictions,:slottype,:string
    add_column :frictions,:expresssample,:integer
    add_column :electro_chemicals,:slottype,:string
    add_column :electro_chemicals,:expresssample,:integer
    add_column :milli_qs,:slottype,:string
    add_column :milli_qs,:expresssample,:integer
    add_column :glove_boxes,:slottype,:string
    add_column :glove_boxes,:expresssample,:integer
    add_column :probe_sonicators,:slottype,:string
    add_column :probe_sonicators,:expresssample,:integer
    add_column :ultra_centrifuges,:slottype,:string
    add_column :ultra_centrifuges,:expresssample,:integer
    add_column :gas_sensings,:slottype,:string
    add_column :gas_sensings,:expresssample,:integer
    add_column :liquid_nitrogens,:slottype,:string
    add_column :liquid_nitrogens,:expresssample,:integer
    add_column :ansies,:slottype,:string
    add_column :ansies,:expresssample,:integer
    add_column :grindings,:slottype,:string
    add_column :grindings,:expresssample,:integer

  end
end
