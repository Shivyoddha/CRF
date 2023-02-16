class CreateIcpMs < ActiveRecord::Migration[7.0]
  def change
    create_table :icp_ms do |t|
      t.string :name

      t.timestamps
    end
  end
end
