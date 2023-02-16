class AddColumnToXrd < ActiveRecord::Migration[7.0]
  def change
    add_column :x_ray_diffractions, :sample, :string
    add_column :x_ray_diffractions, :measurement, :string
    add_column :x_ray_diffractions, :minD, :string
    add_column :x_ray_diffractions, :stype, :string
    add_column :x_ray_diffractions, :maxD, :string
    add_column :x_ray_diffractions, :reference, :string
    add_column :x_ray_diffractions, :more, :string
  end
end
