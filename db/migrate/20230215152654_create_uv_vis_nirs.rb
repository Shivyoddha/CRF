class CreateUvVisNirs < ActiveRecord::Migration[7.0]
  def change
    create_table :uv_vis_nirs do |t|
      t.string :name

      t.timestamps
    end
  end
end
