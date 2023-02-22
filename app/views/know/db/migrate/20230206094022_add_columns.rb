class AddColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment, :name, :string
    add_column :equipment, :status, :string
    add_column :equipment, :feature, :text
    add_column :equipment, :resolution, :text
    add_column :equipment, :location, :text
    add_column :equipment, :application, :text
    add_column :equipment, :facilities, :text
    add_column :questions, :content, :text
    add_column :questions, :type, :string
  end
end
