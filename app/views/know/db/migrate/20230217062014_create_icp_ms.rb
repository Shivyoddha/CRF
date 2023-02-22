class CreateIcpMs < ActiveRecord::Migration[6.1]
  def change
    create_table :icp_ms do |t|
      t.string :sample
      t.string :composition
      t.string :sample_phase
      t.string :nature
      t.string :concentration
      t.string :testing
      t.string :storage
      t.string :toxicity
      t.string :compatibility
      t.string :hazard
      t.string :more

      t.timestamps
    end
  end
end
