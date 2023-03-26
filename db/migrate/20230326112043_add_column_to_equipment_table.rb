class AddColumnToEquipmentTable < ActiveRecord::Migration[6.1]
  def change
    add_column:equipment_tables,:org,:string
    add_column:equipment_tables,:profesion,:string
    add_column:equipment_tables,:innvoice_name,:string
    add_column:equipment_tables,:invoice_address,:string
    add_column:equipment_tables,:invoice_gst,:string
    add_column:equipment_tables,:amount_paid,:float
    add_column:equipment_tables,:gst_applied,:float
    add_column:equipment_tables,:testing,:float
    add_column:equipment_tables,:consulting,:float
    add_column:equipment_tables,:gst,:float
    add_column:equipment_tables,:state,:string
    add_column:equipment_tables,:date_of_depo,:date
    add_column:equipment_tables,:dd_no,:string
    add_column:equipment_tables,:role,:string
  end
end
