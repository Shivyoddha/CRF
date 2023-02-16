class CreateIntergratedMultiRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :intergrated_multi_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
