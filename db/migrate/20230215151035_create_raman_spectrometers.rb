class CreateRamanSpectrometers < ActiveRecord::Migration[7.0]
  def change
    create_table :raman_spectrometer do |t|
      t.string :name

      t.timestamps
    end
  end
end
