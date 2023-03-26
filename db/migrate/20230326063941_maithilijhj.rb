class Maithilijhj < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :heading, :text
  end
end
