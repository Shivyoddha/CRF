class RemoveForiegnKeyS < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :answers, :equipment
    remove_foreign_key :answers, :questions
    remove_foreign_key :answers, :users
    remove_foreign_key :briefs, :contents
    remove_foreign_key :briefs, :equipment
    remove_foreign_key :briefs, :titles
    remove_foreign_key :contents, :equipment
    remove_foreign_key :contents, :titles
    remove_foreign_key :questions, :equipment
    remove_foreign_key :titles, :equipment
  end
end
