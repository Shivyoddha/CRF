class AddColumnToTgaFttr < ActiveRecord::Migration[7.0]
  def change
    add_column :tgaftirs, :sample, :string
    add_column :tgaftirs, :stype, :string
    add_column :tgaftirs, :measurement, :string
    add_column :tgaftirs, :nature, :string
    add_column :tgaftirs, :mintemp, :string
    add_column :tgaftirs, :maxtemp, :string
    add_column :tgaftirs, :scanrate, :string
    add_column :tgaftirs, :atmosphere, :string
    add_column :tgaftirs, :hazard, :string
    add_column :tgaftirs, :compatability, :string
    add_column :tgaftirs, :explosive, :string
    add_column :tgaftirs, :more, :string




  end
end
