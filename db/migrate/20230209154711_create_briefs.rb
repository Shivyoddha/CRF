class CreateBriefs < ActiveRecord::Migration[6.1]
  def change
    create_table :briefs do |t|
      t.string :brief

      t.timestamps
    end
  end
end
