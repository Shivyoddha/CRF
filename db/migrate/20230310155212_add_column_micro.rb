class AddColumnMicro < ActiveRecord::Migration[6.1]
  def change
    remove_column :micro_edms, :milling
    remove_column :micro_edms, :turning
    remove_column :micro_edms, :drilling
    remove_column :micro_edms, :edm
    remove_column :micro_edms, :edg
    add_column:micro_edms,:millingfeed  ,:string
    add_column:micro_edms,:millingspeed ,:string
    add_column:micro_edms,:turningfeed  ,:string
    add_column:micro_edms,:turningspeed ,:string
    add_column:micro_edms,:drillingdepth  ,:string
    add_column:micro_edms,:drillingspeed ,:string
    add_column:micro_edms,:edmvoltage ,:string
    add_column:micro_edms,:edmcapacitance ,:string
    add_column:micro_edms,:edgpolarity ,:string
    add_column:micro_edms,:edgwire ,:string
    add_column:micro_edms,:edgfeed ,:string
  end
end
