class AddColumnToThreeD < ActiveRecord::Migration[7.0]
  def change
    add_column :three_d_scanners, :sample, :string
    add_column :three_d_scanners, :size, :string
    add_column :three_d_scanners, :texture, :string
    add_column :three_d_scanners, :format, :string
    add_column :three_d_scanners, :more, :string
    end
end
