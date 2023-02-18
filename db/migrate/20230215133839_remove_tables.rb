class RemoveTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :questions
    drop_table :answers
    drop_table :titles
    drop_table :contents
    drop_table :briefs
  end
end
