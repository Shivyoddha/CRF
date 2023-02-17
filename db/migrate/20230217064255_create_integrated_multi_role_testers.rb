class CreateIntegratedMultiRoleTesters < ActiveRecord::Migration[7.0]
  def change
    create_table :integrated_multi_role_testers do |t|
      t.string :sample
      t.string :measurement
      t.string :type
      t.string :loading
      t.string :temperature
      t.string :analysis
      t.string :more

      t.timestamps
    end
  end
end
