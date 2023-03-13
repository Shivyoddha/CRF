class AddREferenceToint < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :integrated_multi_role_tester, foreign_key: true

  end
end
