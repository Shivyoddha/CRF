class AddRefernceSpark < ActiveRecord::Migration[6.1]
  def change
    add_reference :spark_os, :user, foreign_key: true
  end
end
