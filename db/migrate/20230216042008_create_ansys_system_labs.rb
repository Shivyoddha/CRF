class CreateAnsysSystemLabs < ActiveRecord::Migration[7.0]
  def change
    create_table :ansys_system_labs do |t|
      t.string :name

      t.timestamps
    end
  end
end
