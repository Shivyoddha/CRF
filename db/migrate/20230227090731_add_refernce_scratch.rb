class AddRefernceScratch < ActiveRecord::Migration[6.1]
  def change
    add_reference :scratch_indentations, :user, foreign_key: true
  end
end
