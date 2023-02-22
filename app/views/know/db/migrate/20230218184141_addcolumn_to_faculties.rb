class AddcolumnToFaculties < ActiveRecord::Migration[6.1]
  def change
    add_column :faculties ,:name, :string
    add_column :faculties ,:department, :string
    add_column :faculties ,:email, :string
  end
end
