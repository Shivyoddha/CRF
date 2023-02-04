class AddColumnstoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :department, :string
    add_column :users, :course, :string
    add_column :users, :orgname, :string
    add_column :users, :orgaddress, :string
    add_column :users, :collegeid, :blob
    add_column :users, :profession, :string
    add_column :users, :rollno, :string
    add_column :users, :contact, :string
  end
end
