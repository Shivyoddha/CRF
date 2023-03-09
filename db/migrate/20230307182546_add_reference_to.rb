class AddReferenceTo < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_tables, :advance_molecular_rheometer, foreign_key: true
    add_reference :equipment_tables, :atomic_force_microscope, foreign_key: true
    add_reference :equipment_tables, :ball_mailing, foreign_key: true
    add_reference :equipment_tables, :bet, foreign_key: true
    add_reference :equipment_tables, :cell_imaging, foreign_key: true
    add_reference :equipment_tables, :electro_chemical, foreign_key: true

  end
end
