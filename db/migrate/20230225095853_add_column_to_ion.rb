class AddColumnToIon < ActiveRecord::Migration[6.1]
  def change
    add_column :ion_chromotographies, :status, :string
    add_column :ion_chromotographies, :debit, :string
    add_column :ion_chromotographies, :slottime, :time
    add_column :ion_chromotographies, :slotdate, :date
    change_column(:ion_chromotographies,:sample,:integer)
    change_column(:ion_chromotographies,:volume,:float)
    change_column(:ion_chromotographies,:temperature,:float)
    change_column(:ion_chromotographies,:flow_rate,:float)
    change_column(:ion_chromotographies,:concentration,:float)
    change_column(:advance_molecular_rheometers,:current,:float)
    change_column(:advance_molecular_rheometers,:shear_rate,:float)
    add_column :ion_chromotographies, :hazard_yes, :string
    add_column :ion_chromotographies, :disposal_yes, :string
    add_reference :ion_chromotographies, :user, foreign_key: true
  end
end
