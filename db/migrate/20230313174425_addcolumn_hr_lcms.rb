class AddcolumnHrLcms < ActiveRecord::Migration[6.1]
  def change
    remove_column :hrlcms,:health
    add_column :hrlcms,:health,:text, default: [].to_yaml
    add_column :hrlcms, :hazard_method, :text, default: [].to_yaml
    add_column :ft_nms, :measurement1, :text, default: [].to_yaml
    add_column :ft_nms, :measurement2, :text, default: [].to_yaml
    add_column :ft_nms, :measurement3, :text, default: [].to_yaml
    add_column :ft_nms, :measurement4, :text, default: [].to_yaml
    add_column :ft_nms, :measurement5, :text, default: [].to_yaml
    add_column :ft_nms, :hazardmethod, :text, default: [].to_yaml
  end
end
