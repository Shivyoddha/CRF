class AddcolumnTgaFtr < ActiveRecord::Migration[6.1]
  def change
    add_column :tga_fttrs, :status, :string
    add_column :tga_fttrs, :slottime, :time
    add_column :tga_fttrs, :slotdate, :date
    add_column :tga_fttrs, :debit, :string
    change_column(:tga_fttrs,:sample,:integer)
    add_column :tga_fttrs, :atr, :string
    add_column :tga_fttrs, :kbr, :string
    add_column :tga_fttrs, :yordinate, :string
  end
end
