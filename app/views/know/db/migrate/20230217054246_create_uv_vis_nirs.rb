class CreateUvVisNirs < ActiveRecord::Migration[6.1]
  def change
    create_table :uv_vis_nirs do |t|
      t.string :sample
      t.string :srange
      t.string :erange
      t.string :measurement
      t.string :composition
      t.string :toxicity
      t.string :sampletype
      t.string :more

      t.timestamps
    end
  end
end
