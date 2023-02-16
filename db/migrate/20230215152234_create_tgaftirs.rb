class CreateTgaftirs < ActiveRecord::Migration[7.0]
  def change
    create_table :tgaftirs do |t|
      t.string :name

      t.timestamps
    end
  end
end
