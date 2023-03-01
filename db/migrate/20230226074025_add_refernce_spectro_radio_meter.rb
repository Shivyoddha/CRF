class AddRefernceSpectroRadioMeter < ActiveRecord::Migration[6.1]
  def change
    add_reference :spectro_radio_meters, :user, foreign_key: true
  end
end
