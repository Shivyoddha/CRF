class RemoveTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :options
    drop_table :ion_chromatographies
  end
end
