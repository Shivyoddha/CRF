class CreateBriefs < ActiveRecord::Migration[7.0]
  def change
    create_table :briefs do |t|
      t.string :brief

      t.timestamps
    end
  end
end
