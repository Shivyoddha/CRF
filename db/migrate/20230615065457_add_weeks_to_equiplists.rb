class AddWeeksToEquiplists < ActiveRecord::Migration[6.1]
  def change
  add_column :equiplists, :month, :string
  add_column :equiplists, :week_1, :string
  add_column :equiplists, :week_2, :string
  add_column :equiplists, :week_3, :string
  add_column :equiplists, :week_4, :string
  add_column :equiplists, :week_5, :string
  end
end
