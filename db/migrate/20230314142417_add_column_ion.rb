class AddColumnIon < ActiveRecord::Migration[6.1]
  def change
    add_column :ion_chromotographies, :hazard_method, :text, default: [].to_yaml
    remove_column:ion_chromotographies,:hazard_yes
  end
end
