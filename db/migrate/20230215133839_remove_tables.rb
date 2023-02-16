class RemoveTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :questions
    drop_table :answers
    drop_table :titles
    drop_table :contents
    drop_table :briefs
  end
end
