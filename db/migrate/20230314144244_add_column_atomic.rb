class AddColumnAtomic < ActiveRecord::Migration[6.1]
  def change
    remove_column:atomic_force_microscopes,:technique
    add_column:atomic_force_microscopes,:technique, :text, default: [].to_yaml
  end
end
