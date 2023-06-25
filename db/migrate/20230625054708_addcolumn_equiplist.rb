class AddcolumnEquiplist < ActiveRecord::Migration[6.1]
  def change
        add_column:xrds,:slottype  ,:string
        add_column:equiplists,:expressstart  ,:date
        add_column:equiplists,:expressend,:date
        add_column:xrds,:expresssample,:integer
        add_column :equiplists, :expressslot, :integer
  end
end
