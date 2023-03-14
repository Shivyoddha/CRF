class AddColumnHrFesemcc < ActiveRecord::Migration[6.1]
  def change
    add_column :hr_fesem_cs, :measuring, :text, default: [].to_yaml
  end
end
