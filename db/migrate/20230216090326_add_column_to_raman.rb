class AddColumnToRaman < ActiveRecord::Migration[7.0]
  def change
    add_column :raman_spectrometer, :sample, :string
    add_column :raman_spectrometer, :measurement, :string
    add_column :raman_spectrometer, :stype, :string
    add_column :raman_spectrometer, :description, :string
    add_column :raman_spectrometer, :toxicity, :string
    add_column :raman_spectrometer, :carcinogenic, :string
    add_column :raman_spectrometer, :compatability, :string
    add_column :raman_spectrometer, :more, :string
  end
end
