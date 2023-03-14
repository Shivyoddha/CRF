class AddcolumnHrlcms < ActiveRecord::Migration[6.1]
  def change
      add_column :hrlcms, :health, :text, default: [].to_yaml
      add_column :hrlcms, :testing_required, :text, default: [].to_yaml
      remove_column:uv_vis_nirs,:health
        remove_column:uv_vis_nirs,:testing_required
  end
end
